Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA4215798;
	Fri, 10 Jan 2025 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540283; cv=none; b=u/FAO6SCPXMNbwpOh60svW1enSLNkHsteCytmv/i3uy8y60fYyMtIRcqehe+m4GTxwvbVW1zFrQ2Pu3i53Wbz4Q0gmVESRsjvmfPwrYMXyFJpI4msDGbiCFsDzlKcWPspdBpJUYNO5qA9dyLSV0VZJerqhMysVSZA7EjdY4DsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540283; c=relaxed/simple;
	bh=7YYK1zfbksfue6c6EzJtcg6I8IGSx1gOujBm6uDCW/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTbxaCncI1kk/qMa4eP0bYyGZkhGp8DkErSox9mvOlsRvnPu5Dcz19mgu5rIXEU90cl6sr2JJVPzvG+RMZTRurV4/MQF10AImUChorOsOozVc9+YE9TI7hqZgjv9G1x0Zqiyxvi8T2x0xRkld5LOZtMLXu/7X6BHgt0uBecsW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3V+8qI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3V+8qI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897BEC4CED6;
	Fri, 10 Jan 2025 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540282;
	bh=7YYK1zfbksfue6c6EzJtcg6I8IGSx1gOujBm6uDCW/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l3V+8qI8Ng2+Lbnz+2NVzBbpDe6zLP1Jo77waljX2r62d4qPs02jPlB1jcjzOIKmR
	 gg/F3inU/WimCEty7myziRc24ECSDyXniuV0tXBhoPfsrqKa2EBsbio02S/JHTwd+k
	 jQa8GTuW8RIiKN+7bVqtEBekTmrmPwe9TzR5B8fSis/cq55QbppK9C1bsfkeJuMf49
	 CeRBEjc5K//7V568l0jMrNcw2QuoVgfciYICas26akpcwJY9/6NwTPfIStmUzNh2uG
	 sqXgjTOIk8McdK2ytk4Hk75FRXSpLUeL43S8w0w/DoWkR6gWeUuK70ctKsO1sZ0zsR
	 HOx5JZhxGezWw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:36 +0100
Subject: [PATCH v6 13/14] rust: hrtimer: add clocksource selection through
 `ClockSource`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-13-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4052; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7YYK1zfbksfue6c6EzJtcg6I8IGSx1gOujBm6uDCW/A=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/rVL3r3gDMnhL43bR5LOHXlB6eubzvyXa4k
 EixfBjPOsWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/6wAKCRDhuBo+eShj
 d4sOD/0cXvWCnjl5CJ0vgi3p7l3mN5O8Q3lUTtt1uutyrCj1FVZdm1wkdgrQjhprLfAl2eOwGhL
 qH2Vs9MrC5IQICHr4KfmLhnN3ogWc3Es4zCxn47YmoP5L8prknV1icoR9YpTbxHhYf6Q0F+iSyN
 iUL3tnQ8SpRPXtW+cHaYQWhMwtnDHkaL3Kgb4iiIXXM5i+tf5zSl5aYkbby+NilYu26FIxzSR33
 lXHu2Iw9t0HIvr8GoCzkRBDCz8aeYRHrN98p+sFR1ZJ9lfrQzsVKayqNTDSJF7uSV2EwHbxFMU3
 5PSpD24BbKfmhAlD3FA98cCN6DAuCeIgtOqvHGNMZdH72ncCsWntehAQQ6ovbILv0QBmBJo6J2I
 AdGKkR4a/TmbETlpaJ8y2mD7lU/ivLaB8AL6Oic80dnP2S9+wLOqJthTcPP4Kwlm4hnVbM0+FXP
 R+1SdMoHePcuxqQD9sVw/7K0Q98jF/d36GixwpiN0rOROKiojUa8vmcxaWUrPjkI9vxDVwMFJeX
 UweUh4wijjjWlEl1ICnFUPTsyRrov4BF7EotEVquAYVBlM5dsTQ9SUMmBFOt8o+kro7zVlQVPvN
 uUAdckxy1hCpxCSjg/MpKNpsutQHG01dlxPnkBckHXH2oizpDCk0a1pzCBY5gmy1sgrS0HbGeqQ
 GHzRatvtSd4qwBg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow selecting a clock source for timers by passing a `ClockSource`
variant to `HrTimer::new`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 52 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 232af60f7c38370a4b2414a4c3780e06d2aa0c7d..f759e4b1aa9f9fa6d55d5c144deedccc5d0590ae 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -57,7 +57,7 @@ unsafe impl<U> Sync for HrTimer<U> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
+    pub fn new(mode: HrTimerMode, clock: ClockSource) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -71,7 +71,7 @@ pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
                     bindings::hrtimer_setup(
                         place,
                         Some(T::CallbackTarget::run),
-                        bindings::CLOCK_MONOTONIC as i32,
+                        clock.into(),
                         mode.into(),
                     );
                 }
@@ -442,6 +442,54 @@ fn from(value: HrTimerMode) -> Self {
     }
 }
 
+/// The clock source to use for a [`HrTimer`].
+pub enum ClockSource {
+    /// A settable system-wide clock that measures real (i.e., wall-clock) time.
+    /// Setting this clock requires appropriate privileges. This clock is
+    /// affected by discontinuous jumps in the system time (e.g., if the system
+    /// administrator manually changes the clock), and by frequency adjustments
+    /// performed by NTP and similar applications via adjtime(3), adjtimex(2),
+    /// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
+    /// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
+    /// (UTC) except that it ignores leap seconds; near a leap second it is
+    /// typically adjusted by NTP to stay roughly in sync with UTC.
+    RealTime,
+    /// A nonsettable system-wide clock that represents monotonic time since—as
+    /// described by POSIX—"some unspecified point in the past". On Linux, that
+    /// point corresponds to the number of seconds that the system has been
+    /// running since it was booted.
+    ///
+    /// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
+    /// system time (e.g., if the system administrator manually changes the
+    /// clock), but is affected by frequency adjustments. This clock does not
+    /// count time that the system is suspended.
+    Monotonic,
+    /// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
+    /// except that it also includes any time that the system is suspended. This
+    /// allows applications to get a suspend-aware monotonic clock without
+    /// having to deal with the complications of CLOCK_REALTIME, which may have
+    /// discontinuities if the time is changed using settimeofday(2) or similar.
+    BootTime,
+    /// A nonsettable system-wide clock derived from wall-clock time but
+    /// counting leap seconds. This clock does not experience discontinuities or
+    /// frequency adjustments caused by inserting leap seconds as CLOCK_REALTIME
+    /// does.
+    ///
+    /// The acronym TAI refers to International Atomic Time.
+    TAI,
+}
+
+impl From<ClockSource> for bindings::clockid_t {
+    fn from(value: ClockSource) -> Self {
+        match value {
+            ClockSource::RealTime => bindings::CLOCK_REALTIME as i32,
+            ClockSource::Monotonic => bindings::CLOCK_MONOTONIC as i32,
+            ClockSource::BootTime => bindings::CLOCK_BOOTTIME as i32,
+            ClockSource::TAI => bindings::CLOCK_TAI as i32,
+        }
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.

-- 
2.47.0


