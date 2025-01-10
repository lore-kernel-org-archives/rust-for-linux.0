Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56231215F5A;
	Fri, 10 Jan 2025 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540288; cv=none; b=my7avGnqT3JoKr7vME4D2NzX2psMhrMgNa39FRqkVvulP9FdVY/M3cEo1RE+9S7d53MbvyL5RWYLNhp8h73Xeu0dyrN/P5VMfnWZFYuV8NHEiJ9Lll+ri5/JLX9ecnlo5kOpiWGv0qA3uuCrmOFTnvdJCFuAlW4snN+hb7KnWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540288; c=relaxed/simple;
	bh=XngAb+MePol3X8OjyUa+d0aupIMZLz1Lew9UVxGS/08=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X3n1k93x+Ui8LydjshU83O56JxYdPw+dtxDQJ8UBr5tjf9126tYzytAJFyYUihN0ux4Beh8tg24ImJ+2jOAeg0YNWQxi6KtPy6PRjw7ZopclheFi3fVBr983HUj0zCNWUJ9MQPJ76FPsnxF5oSTz8smC7aUbnHIsRgST0o9HAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBuv7/4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBuv7/4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB642C4CEDD;
	Fri, 10 Jan 2025 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540287;
	bh=XngAb+MePol3X8OjyUa+d0aupIMZLz1Lew9UVxGS/08=;
	h=From:Subject:Date:To:Cc:From;
	b=eBuv7/4EXOHsyDDJEZJKMaH6BBCLnq6K3csB0wswfeG/op4Le8wz369fzC0uMptz5
	 0E0ZGMt178JQCv0WqiW/+1V+IP9+mRcAJHNOl0e2taI5pECcym4vq86CFGccyo02JZ
	 04/PqmYxmVwqVYrnH8pIyGAQ2h65tQamKNDNkCSgNO+YYTYk4hiCfFS4u2UAc7NCqf
	 MqFmVb0ECYtsnuaYqg8U30RoQf5CSShWPEondawGh/hyJH0meFLkICcAhvQz1iJmTd
	 mY3be1pQDpsi6OKSyAClWv+UMbvBBw45QBCfZHYlW+X+3R9lVnpl/B76/wQVBfsP5x
	 ETZrt32Lt57hw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v6 00/14] hrtimer Rust API
Date: Fri, 10 Jan 2025 21:15:23 +0100
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANt/gWcC/3XO32rDIBiH4VspHk/RT/2MO+p9jB34r410McWEs
 FFy77MZrBslZ/6E99EbmVLNaSKvhxupaclTHksb+HIgoXflnGiObRPgoAQXhvZ1zkOqdJF0QSq
 A1gAUhI4BvUDrT6Sl15pO+XNj397b7vM0j/Vre2UR99sN5Ao0twqlYoCARlFBy5CPQ5rddHUhs
 Xgh936BR2OFAQAjLRNgOzC6RY71uUQ/1vPxkmpJH6wdf0r5W+5/vw1OtXVGB++Viu5JUQ8FOO4
 oqikYfBckGokdPCn6j7L7F90UL1UA7gIEb/4p67p+A4tLrzazAQAA
X-Change-ID: 20241017-hrtimer-v3-v6-12-rc2-215dc6b169bf
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4468; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=XngAb+MePol3X8OjyUa+d0aupIMZLz1Lew9UVxGS/08=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/flR2WQlTpjZ0jhMOFsVDwkutOqyfavKQyI
 a/ZCfYQ3dCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/3wAKCRDhuBo+eShj
 dzbyD/0VDTsc+uWQ44dhCmq2mrJMG124sENvTj9RZr18HlFiTlR/H+FS6Ja+cKyhc+TbCiH9i8s
 MByXh6eHgACGEaTCTv+GUB1m0/dsaV693dEnvcYYFyk6KWAyRzqErlvPBa4Bq0/w5s77QpDmG7y
 uai65Pxdz5CXs/szHCIz/iaiEK2rn6sYqd9iwg+DLJMa0Wsx3+/3Nt6xqOvm86Aj0ODMJGiIFQz
 cYlnZeixWgARTBXDMjelsI+S45ihApx/ccl3Hg4D3hXxD53GGWUfKfg624cfy+oWm1v+3CCw78K
 uKmvMeWqPFXuHXdIHMBbrVFRp7UQasflo80Sdo7wNwfNV+6SNc1HBy4y/KMXeQACX3v68PMwMw1
 lj15Q4K348dpj1alFWAPITjgXHD3mm15atNGJjfCvJ54mU4wksE3duuI+H+yh99MeKA956bLzCK
 E5XfFaeOimS3fQKQKMbXybpqbDfubyQDVIfIbwWb/G1cbmmGcpdXDZ3Gf6gokMEgJcxW+eJtsAn
 xiW9277mLOrWIr1GdM3qnTsjswoSplPa0qqpD4cBFb9rVEk6P/JFk6r5GDrOh+maUFWSfxAdhyU
 Lfe33WfhVwcP7auB+J1CBrKvKmq3zrvU0jW7BgGVtSVvlWarQbaFWalnn92u317GefFYu+OYoNB
 pFIbqHbgYDl6sDg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds support for using the `hrtimer` subsystem from Rust code.

The series adds support for timer mode and clock source configuration during
timer initialization. Examples and functionality to execute closures at timer
expiration has been removed, as these depend on either atomics [3] or
`SpinLockIrq` [4], which are still being worked on.

This series is a dependency for unmerged features of the Rust null block driver
[1], and for rkvms [2].

Link: https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull-v6.11-rc2 [1]
Link: https://gitlab.freedesktop.org/lyudess/linux/-/tree/rvkms-wip [2]
Link: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/ [3]
Link: https://lore.kernel.org/rust-for-linux/20240916213025.477225-1-lyude@redhat.com/ [4]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v6:
- prefix all hrtimer related type names with `Hr`
- add a few links for type names in the documentation
- Link to v5: https://lore.kernel.org/r/20241217-hrtimer-v3-v6-12-rc2-v5-0-b34c20ac2cb7@kernel.org

Changes in v5:
- Fix a typo in `impl_has_timer`
- Implement `Box::into_pin` in terms of `impl From<Box> for Pin<Box>`
- Link to v4: https://lore.kernel.org/r/20241206-hrtimer-v3-v6-12-rc2-v4-0-6cb8c3673682@kernel.org

Changes in v4:
- rebase on v6.13-rc1 and adapt to kernel `Box`
- add a missing safety comment to `hrtimer::start`
- use `hrtimer_setup`
- fix a build issue when `bindings::hrtimer_restart` is signed
- fix a memory leak where box was not destroyed
- fix a documentation typo
- remove `as` coercion at multiple locations
- use fully qualified syntax when invoking `deref`
- move `hrtimer` into `time` module
- Link to v3: https://lore.kernel.org/r/20241017-hrtimer-v3-v6-12-rc2-v3-0-59a75cbb44da@kernel.org

Changes in v3:
- support timer mode selection
- support clock source selection
- eliminate `Arc::clone_from_raw` in favor of using `ArcBorrow`
- make `Arc::as_ptr` an associated method
- update safety requirement for `ArcBorrow::from_raw`
- remove examples (pending `SpinLockIrq` and `CondVar` patches)
- remove `start_function` (v2 `schedule_function`, pending `SpinLockIrq` and `CondVar` patches)
- change function naming from schedule/armed to start/running
- add vocabulary to documentation
- update safety comment in `Arc::as_ptr`
- Link to v2: https://lore.kernel.org/r/20240917222739.1298275-1-a.hindborg@kernel.org

Changes in v2:
- use a handle to own the timer callback target
- add ability to for callback to reschedule timer
- improve `impl_has_timer` to allow generics
- add support for stack allocated timers
- add support for scheduling closures
- use `Ktime` for setting expiration
- use `CondVar` instead of `AtomicBool` in examples
- rebase on 6.11
- improve documentation
- Link to v1: https://lore.kernel.org/r/20240425094634.262674-1-nmi@metaspace.dk

---
Andreas Hindborg (13):
      rust: hrtimer: introduce hrtimer support
      rust: sync: add `Arc::as_ptr`
      rust: hrtimer: implement `HrTimerPointer` for `Arc`
      rust: hrtimer: allow timer restart from timer handler
      rust: hrtimer: add `UnsafeHrTimerPointer`
      rust: hrtimer: add `hrtimer::ScopedHrTimerPointer`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&T>`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&mut T>`
      rust: alloc: add `Box::into_pin`
      rust: hrtimer: implement `HrTimerPointer` for `Pin<Box<T>>`
      rust: hrtimer: add `HrTimerMode`
      rust: hrtimer: add clocksource selection through `ClockSource`
      rust: hrtimer: add maintainer entry

Lyude Paul (1):
      rust: time: Add Ktime::from_ns()

 MAINTAINERS                         |  10 +
 rust/kernel/alloc/kbox.rs           |   6 +
 rust/kernel/sync/arc.rs             |  13 +-
 rust/kernel/time.rs                 |  10 +
 rust/kernel/time/hrtimer.rs         | 529 ++++++++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer/arc.rs     |  87 ++++++
 rust/kernel/time/hrtimer/pin.rs     |  95 +++++++
 rust/kernel/time/hrtimer/pin_mut.rs |  97 +++++++
 rust/kernel/time/hrtimer/tbox.rs    | 102 +++++++
 9 files changed, 947 insertions(+), 2 deletions(-)
---
base-commit: 8093380ff7bf546cf202531729705208911b87f1
change-id: 20241017-hrtimer-v3-v6-12-rc2-215dc6b169bf

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


