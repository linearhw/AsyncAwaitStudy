//
//  API.swift
//  SuperStorage
//
//  Created by seon.yeong on 2022/07/06.
//

import Foundation

class API {
    func fetchName() async throws -> String {
        // Q. error customize 는 어떻게?
        // Q. 특정 queue 에서만 수행해야 하는 경우
        // Q. 내부 구현은 completion handler 스타일인데 async throws 스타일로 만드는 게 가능한지
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "SampleName"
    }
    
    func fetchDesc() async throws -> String {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        return "SampleDesc"
    }

    // Ch2
    // Q. 두 await job 이 shared resource 를 사용하면?
        // A. 순서 보장이 안되기 때문에 값이 어떻게 업데이트 될지 보장할 수 없음
    // Q. 아래의 형태에서 두 await job 이 race condition 을 만들면?
        // A. 컴파일 에러 안 난다. 빌드 및 실행 잘 된다. 단지 무한 재귀호출을 하고 있을 뿐...
    // Q. await functions 들에 priority 를 주는 게 가능할까?
        // A. Task(priority: .high). high -> medium -> low -> background
    // Q. child task 가 error 를 줬을 때 retry 해서 위로 에러를 안 넘기는 게 가능할까?
    // Q. let webtoons = titleNos.map({ try async fetchWebtoon(titleNo: $0 }) 가능?
    
    // Ch3
    // Controlling a task's lifetime
    // 부모 task 를 취소하면 자식 task 도 자동으로 취소할 수 있다
    // 아니면 실행하는 쪽에서 current task is cancelled 를 체크해서 manually cancel 도 가능
    // 취소하면 어떤 에러 떨어지나요? 이걸 wrapping 하는 게 좋을까요 안하는 게 좋을까요?
}
