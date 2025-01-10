Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD9218592;
	Fri, 10 Jan 2025 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540235; cv=none; b=WP/jS5qosbyzyTHJ4Nw1qvRWrdoCgw0NwvFSC+XHY4gPOTymGcVcvlfJAgMO1xzPUBOTnoJfUEOG6Xt9Q3uktbgVNffIpWQ4iMikST7RGfe++VdSzp58AQjKGlCNywrXus0ahRg9oiWv3Ty2lPiYsFDs/Z3MxLjfdGW004yRKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540235; c=relaxed/simple;
	bh=nPGdlJp4Nza1iyCRFxL+z26yGf76gLwJEu+2wLItMsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=au7S6NuaFlyxbM4dzNGcKpZI2WzvFODGzfkJs8C0ktRuhD/5d5qsHghasgr2LRdJjAzmsKr2ZwmNEkAu6w7W5/RZKr62EzQnudpBXHUyABSNIIJWL0RKQkSyg9HAmC7B0/6IFk6HsiX0e7ZgxyMYQsMcjvqrxi7mOBkkppQ9ywQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iitC+UxZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iitC+UxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF260C4CED6;
	Fri, 10 Jan 2025 20:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540233;
	bh=nPGdlJp4Nza1iyCRFxL+z26yGf76gLwJEu+2wLItMsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iitC+UxZuJI5S7Hj8M7QTCsGRvMmy9m0ySuJ6YmmAEPTJ8XmRLG/T8HnOtnb2zzVh
	 pxYTOaYsAQk+v73cJXDF6k+PoQAW/Ni/alrbrSTNtsxjWIBax465d3TaZy05OOG9gr
	 mevsBfCa+/5WBLMdiiKcMH/DL29hwBZhH02TXrwE0B068EoBzl/GM/6gJs+cJoGzt2
	 3TJYq8Y9Y6YxpBqteM5Z+ExwDoPUuiQFab/3twvVdUafZXWmQjueJyYt6oZMNulfH9
	 xhS7ylTEnFtpfnY1Exx4bMPGXuhlmlDrX67QbzBFkrj2NB1o1NSRRtcnPgHdm+i0YL
	 58Fjpyr3Z6FWQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:28 +0100
Subject: [PATCH v6 05/14] rust: hrtimer: allow timer restart from timer
 handler
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=nPGdlJp4Nza1iyCRFxL+z26yGf76gLwJEu+2wLItMsA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/jvGsC63ejg77FE9GT3c7583mCWWo1jkAEW
 88iKj14Z9uJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/4wAKCRDhuBo+eShj
 d+52D/0aLkeZXH33X2KCz6HJk1V7f/4YSS/MrRH0nA9qV3zVtNySlMyIuKeB2LyNZl8Smu4M3eD
 chb1OYZWfzE3UYrfPV5oCTqMwZcI8Q3sNabi6AofqL61MJV+hHjx04FDUQwv0SZq1SuuBG4axyR
 CAP7crM3wbEPbu9hQFiulnvXhmdw/W2wQ1KoEULufh9nlWoKqzca+sxbGuE3yjYMJQ6zWQpaimh
 zST8DDtnfoY4H2nfTzfFOQu4ez5RR2xIJKIVGhk+kfbAgpw6FI0R0Y/z/4dcB45oQ9zF8Ht2GQw
 tuJLq9Qe9EOi7mnvnSl3ypfCoMy+3OLk4kh15uno9w15XY2lzOwdvDjC9Pf+wx+tNoq7/WexWRG
 4oirBivmQHTxG6xxlo/9S60vVIp2z6f4oyKDSU7thxzmOUnKI5qNIWaoj2un80cYeyYi7SFwkN+
 PyJJLCBn8MLQB72GQP6p/eNrTN6JS0E0ii05PZwKdQRQHZ05Uu9tarY6bIen4M/Linrl8KpjO0n
 Zbfv6D83ntuWhfjU93ueBpDA5vx4xrC1Hcc4ik4v58+W1Kvwfl++3TnE3ETYctzcYKrjEBcjISL
 b0x4uy9PDqHYlH0dEqDGHGxBvJNMTmoMj8sn20TFzt9f3+fDWxZb+E1kuGusHivEd2K7AV7pt+p
 Xv3Byquz89e9XNA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch allows timer handlers to report that they want a timer to be
restarted after the timer handler has finished executing.

Also update the `hrtimer` documentation to showcase the new feature.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     | 37 ++++++++++++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs |  4 +---
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index d0842c7c4c6ddffeef9a79cbf9727819060e4333..50e8c23578b5cf7196893ac88d9547fc027f1f04 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -167,7 +167,7 @@ pub trait HrTimerCallback {
     type CallbackTargetParameter<'a>;
 
     /// Called by the timer logic when the timer fires.
-    fn run(this: Self::CallbackTargetParameter<'_>)
+    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
     where
         Self: Sized;
 }
@@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: Ktime) {
     }
 }
 
+/// Restart policy for timers.
+pub enum HrTimerRestart {
+    /// Timer should not be restarted.
+    NoRestart,
+    /// Timer should be restarted.
+    Restart,
+}
+
+impl From<u32> for HrTimerRestart {
+    fn from(value: u32) -> Self {
+        match value {
+            0 => Self::NoRestart,
+            _ => Self::Restart,
+        }
+    }
+}
+
+impl From<i32> for HrTimerRestart {
+    fn from(value: i32) -> Self {
+        match value {
+            0 => Self::NoRestart,
+            _ => Self::Restart,
+        }
+    }
+}
+
+impl From<HrTimerRestart> for bindings::hrtimer_restart {
+    fn from(value: HrTimerRestart) -> Self {
+        match value {
+            HrTimerRestart::NoRestart => bindings::hrtimer_restart_HRTIMER_NORESTART,
+            HrTimerRestart::Restart => bindings::hrtimer_restart_HRTIMER_RESTART,
+        }
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 4c1812f190bc7a9e0b2fcd5ea2e320f45ba584bc..cee143b04aa21fa6c60c3363cd95f7a67360cbf8 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -82,8 +82,6 @@ impl<U> RawHrTimerCallback for Arc<U>
         // timer. This `U` is contained in an `Arc`.
         let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
 
-        U::run(receiver);
-
-        bindings::hrtimer_restart_HRTIMER_NORESTART
+        U::run(receiver).into()
     }
 }

-- 
2.47.0


