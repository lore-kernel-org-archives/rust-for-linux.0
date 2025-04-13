Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE72EAE6
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541823; cv=none; b=sKSULjbXQh7D7KrEXcI9YkeTvcyWwUpqZhitQRiDAIlL2MVoXgn5F3AnS5TcHx+i7abj4Pc/0i3YxqkLerYgCZrtLBKVx5NB+Uz02IUbgIoM8rgYXKYS+nUOIXyGCBEE9UoW/MzRYObojQo/wHVpRWHjzW3i1cP032dSA5OVBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541823; c=relaxed/simple;
	bh=5ZxYreCuBlhMvWbb6HD9n2liGnJgesPUYiPr+Wg6eIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1dEDRYs4aAYOQxNY0SzoqmdDTZpY1iWsEnJqQfLc7N4bc/AoU3IAqpQToYX8TyRCFpzOs3MuQcyyoYVh2yYBRRNAMaf+WgM70EjbPwIl7oz19YVymZdp/IZFSXSWX+t1AkQ/wMuFFDTUN998mhGuZKUQ0PDsjHxtafUkzC0ulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9y2p5cL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9y2p5cL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so30741675ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541821; x=1745146621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YAoZzWlhvi948K5hEyk69QS6OeKyCaleic5+aBVZaU=;
        b=B9y2p5cLZ7tfwrKFnZNKoKe3fZWgBh/tUD9RPaBblIR3IcrpFVSJ8T0VH4y/1kXDn+
         2WzoCqUsvXNRzm/7N7J6fmKjOwYnNfVftfygrqq+/WVINOUPDr1fAg5+lFIRLGlO0fQP
         09YmdJ6FBAHK8EIesrG4uSdEb1B/rN0I/6VVbxD5Cy7QqYJkBp3PSfRx0q4RTE0Dow5e
         suAMDEzgmOqbzHPoRfAcamEBeHHErteI2XKIeYuMNHo2cH3HLw5Z0PjNXT2gP4hiYqUm
         zDJnt41dfO7aszwP3i2dhRJ9lk62I24IZrPWy5/r9ud6v3IOowVaEiOJ0xO6hol3nxEe
         rcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541821; x=1745146621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YAoZzWlhvi948K5hEyk69QS6OeKyCaleic5+aBVZaU=;
        b=RbCn+jAlltakBUH65ym69TkRR6PRHuBENiT0QU/jdQ/xJSvF99yRb88Gm7hqbOV7Yw
         2jHcH2QgnASf3h5RYTHd97sr6T44NijoycY9Fuod/L+MFhcw7isH1mbV6nuj08CXjXHP
         G0vGs8b9qViW8ZG+Bmrw6LuvAZltTKggijdk3+mraHsCpdKHAW7heOExwBf25dYd2kYT
         5Zlc11m8uRV0jFrmyjRgdoSwWSSXxJFi6nQh+gKDvVD0ABit7ab/h5d0iN+ikfzLDWcu
         op6egollY/1f0ZipbvUtBQUF9aP5E7rrQd6xeWgWX+AT/4Oo5zSgwlwg4OoemxjnUpFQ
         BlWg==
X-Gm-Message-State: AOJu0YwL2EF9jGe7LpNAvhGmYFJVOAEv3DQLrGn0J/ULjyCAfjw/UTTU
	RNKnEnAtaufmI7AJtxnIrLbe/QG/YMdzSj7LweMUd4Gq0gpUDEpbfxdMMs+Y
X-Gm-Gg: ASbGnctKm9YnINl7bJ92Z7YfEqTXzTldXRpU/+wClRla1/pXyZsZuT8k8lGfxppikOf
	O4zej8kT5smG6WMKq061JlXKkVX2E2h3A27ROQAZ1QUNz7gJO+E6odqiqCAl2eT54F0T5IllrGA
	5He9Kqgwkny+mi1DmxG+lc/8okA3bQ3esTJGyOgoQFFCOz+ChmkpglB04ICGghiHrD0sNejoJ+B
	s7XIszPjZbfOucZGQRJZfdqbpB9a7sKP4WsnrFG2bCZIfEqYQms4gjGbt+Tt00TDvuPTQgLOxJ6
	HkHvjAV1MGAk7Pud/gdQCP3mfUSkNpqZ7lXGqPDL0n7YtjMhfCtOYOY9Vb9TAh9OYp9eHd5VzlT
	fjTM1OozAdo3Zkkwx+A==
X-Google-Smtp-Source: AGHT+IE2jiW4g6/gMxq6nxL0E7+tY8vbyCGl3fRJO3DvIiH72KN20wKu+875thLIBUr5e011XmBcEQ==
X-Received: by 2002:a17:902:ef4c:b0:224:76f:9e4a with SMTP id d9443c01a7336-22bea4ab7e3mr124465295ad.14.1744541820900;
        Sun, 13 Apr 2025 03:57:00 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccab77sm80667215ad.214.2025.04.13.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:57:00 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: [PATCH v1 1/3] rust: time: replace ClockId enum with ClockSource trait
Date: Sun, 13 Apr 2025 19:56:26 +0900
Message-ID: <20250413105629.162349-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413105629.162349-1-fujita.tomonori@gmail.com>
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the ClockId enum with a trait-based abstraction called
ClockSource. This change enables expressing clock sources as types and
leveraging the Rust type system to enforce clock correctness at
compile time.

This also sets the stage for future generic abstractions over Instant
types such as Instant<C>.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs         | 147 ++++++++++++++++++++----------------
 rust/kernel/time/hrtimer.rs |   6 +-
 2 files changed, 84 insertions(+), 69 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 8d6aa88724ad..64f36476d519 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -50,6 +50,87 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
     unsafe { bindings::__msecs_to_jiffies(msecs) }
 }
 
+/// Trait for clock sources.
+///
+/// Selection of the clock source depends on the use case. In some cases the usage of a
+/// particular clock is mandatory, e.g. in network protocols, filesystems. In other
+/// cases the user of the clock has to decide which clock is best suited for the
+/// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
+/// provides a accurate monotonic notion of time (leap second smearing ignored).
+pub trait ClockSource {
+    /// The kernel clock ID associated with this clock source.
+    ///
+    /// This constant corresponds to the C side `clockid_t` value.
+    const ID: bindings::clockid_t;
+}
+
+/// A monotonically increasing clock.
+///
+/// A nonsettable system-wide clock that represents monotonic time since as
+/// described by POSIX, "some unspecified point in the past". On Linux, that
+/// point corresponds to the number of seconds that the system has been
+/// running since it was booted.
+///
+/// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
+/// CLOCK_REAL (e.g., if the system administrator manually changes the
+/// clock), but is affected by frequency adjustments. This clock does not
+/// count time that the system is suspended.
+pub struct Monotonic;
+
+impl ClockSource for Monotonic {
+    const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
+}
+
+/// A settable system-wide clock that measures real (i.e., wall-clock) time.
+///
+/// Setting this clock requires appropriate privileges. This clock is
+/// affected by discontinuous jumps in the system time (e.g., if the system
+/// administrator manually changes the clock), and by frequency adjustments
+/// performed by NTP and similar applications via adjtime(3), adjtimex(2),
+/// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
+/// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
+/// (UTC) except that it ignores leap seconds; near a leap second it may be
+/// adjusted by leap second smearing to stay roughly in sync with UTC. Leap
+/// second smearing applies frequency adjustments to the clock to speed up
+/// or slow down the clock to account for the leap second without
+/// discontinuities in the clock. If leap second smearing is not applied,
+/// the clock will experience discontinuity around leap second adjustment.
+pub struct RealTime;
+
+impl ClockSource for RealTime {
+    const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
+}
+
+/// A monotonic that ticks while system is suspended.
+///
+/// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
+/// except that it also includes any time that the system is suspended. This
+/// allows applications to get a suspend-aware monotonic clock without
+/// having to deal with the complications of CLOCK_REALTIME, which may have
+/// discontinuities if the time is changed using settimeofday(2) or similar.
+pub struct BootTime;
+
+impl ClockSource for BootTime {
+    const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
+}
+
+/// International Atomic Time.
+///
+/// A system-wide clock derived from wall-clock time but counting leap seconds.
+///
+/// This clock is coupled to CLOCK_REALTIME and will be set when CLOCK_REALTIME is
+/// set, or when the offset to CLOCK_REALTIME is changed via adjtimex(2). This
+/// usually happens during boot and **should** not happen during normal operations.
+/// However, if NTP or another application adjusts CLOCK_REALTIME by leap second
+/// smearing, this clock will not be precise during leap second smearing.
+///
+/// The acronym TAI refers to International Atomic Time.
+pub struct Tai;
+
+impl ClockSource for Tai {
+    const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
+}
+
 /// A specific point in time.
 ///
 /// # Invariants
@@ -97,72 +178,6 @@ fn sub(self, other: Instant) -> Delta {
     }
 }
 
-/// An identifier for a clock. Used when specifying clock sources.
-///
-///
-/// Selection of the clock depends on the use case. In some cases the usage of a
-/// particular clock is mandatory, e.g. in network protocols, filesystems.In other
-/// cases the user of the clock has to decide which clock is best suited for the
-/// purpose. In most scenarios clock [`ClockId::Monotonic`] is the best choice as it
-/// provides a accurate monotonic notion of time (leap second smearing ignored).
-#[derive(Clone, Copy, PartialEq, Eq, Debug)]
-#[repr(u32)]
-pub enum ClockId {
-    /// A settable system-wide clock that measures real (i.e., wall-clock) time.
-    ///
-    /// Setting this clock requires appropriate privileges. This clock is
-    /// affected by discontinuous jumps in the system time (e.g., if the system
-    /// administrator manually changes the clock), and by frequency adjustments
-    /// performed by NTP and similar applications via adjtime(3), adjtimex(2),
-    /// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
-    /// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
-    /// (UTC) except that it ignores leap seconds; near a leap second it may be
-    /// adjusted by leap second smearing to stay roughly in sync with UTC. Leap
-    /// second smearing applies frequency adjustments to the clock to speed up
-    /// or slow down the clock to account for the leap second without
-    /// discontinuities in the clock. If leap second smearing is not applied,
-    /// the clock will experience discontinuity around leap second adjustment.
-    RealTime = bindings::CLOCK_REALTIME,
-    /// A monotonically increasing clock.
-    ///
-    /// A nonsettable system-wide clock that represents monotonic time since—as
-    /// described by POSIX—"some unspecified point in the past". On Linux, that
-    /// point corresponds to the number of seconds that the system has been
-    /// running since it was booted.
-    ///
-    /// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
-    /// CLOCK_REAL (e.g., if the system administrator manually changes the
-    /// clock), but is affected by frequency adjustments. This clock does not
-    /// count time that the system is suspended.
-    Monotonic = bindings::CLOCK_MONOTONIC,
-    /// A monotonic that ticks while system is suspended.
-    ///
-    /// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
-    /// except that it also includes any time that the system is suspended. This
-    /// allows applications to get a suspend-aware monotonic clock without
-    /// having to deal with the complications of CLOCK_REALTIME, which may have
-    /// discontinuities if the time is changed using settimeofday(2) or similar.
-    BootTime = bindings::CLOCK_BOOTTIME,
-    /// International Atomic Time.
-    ///
-    /// A system-wide clock derived from wall-clock time but counting leap seconds.
-    ///
-    /// This clock is coupled to CLOCK_REALTIME and will be set when CLOCK_REALTIME is
-    /// set, or when the offset to CLOCK_REALTIME is changed via adjtimex(2). This
-    /// usually happens during boot and **should** not happen during normal operations.
-    /// However, if NTP or another application adjusts CLOCK_REALTIME by leap second
-    /// smearing, this clock will not be precise during leap second smearing.
-    ///
-    /// The acronym TAI refers to International Atomic Time.
-    TAI = bindings::CLOCK_TAI,
-}
-
-impl ClockId {
-    fn into_c(self) -> bindings::clockid_t {
-        self as bindings::clockid_t
-    }
-}
-
 /// A span of time.
 ///
 /// This struct represents a span of time, with its value stored as nanoseconds.
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 27243eaaf8ed..12c359dbb895 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -67,7 +67,7 @@
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
 
-use super::ClockId;
+use super::ClockSource;
 use crate::{prelude::*, time::Instant, types::Opaque};
 use core::marker::PhantomData;
 use pin_init::PinInit;
@@ -96,7 +96,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new(mode: HrTimerMode, clock: ClockId) -> impl PinInit<Self>
+    pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -110,7 +110,7 @@ pub fn new(mode: HrTimerMode, clock: ClockId) -> impl PinInit<Self>
                     bindings::hrtimer_setup(
                         place,
                         Some(T::Pointer::run),
-                        clock.into_c(),
+                        U::ID,
                         mode.into_c(),
                     );
                 }
-- 
2.43.0

