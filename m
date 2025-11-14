Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE6215F42;
	Fri, 14 Nov 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131715; cv=none; b=RUc5SqHWNUSZ62jIYQu+ifnRpBUXplJjoJ+6YpQmtcVkxF8eG5OXiYq0IeKFPEjl3KIQtKzO2xRYbuLnCc0OVbunrI5nVO2jo+N+PL6/+cBrvInVtMsFXb2GMgmrqCcuqsHnrtjpO1Ye40nvpHtS7IkBweyA4RtxA/GbhiqPyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131715; c=relaxed/simple;
	bh=xWikcpGmf0wHK8yffg5D29GO53o5QMoIYZYCMXioG+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Eeb9KF13qSK0sGU+f6APVs/LBOgbIdKpKn19GFTCmumKIe2rnuJyUj8zoTUzTs/y0TTb/xVww1/vmLwHyTvXKqZxOuh4CcVQbCMA5L5XNDeYSAAdh7qZ06NeGAlM8OdRvr4ZnpAV5izUWy3+A6YbQiGesuBG4owgPCh2/LgXsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+e2gG9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+e2gG9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32328C4CEF8;
	Fri, 14 Nov 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131714;
	bh=xWikcpGmf0wHK8yffg5D29GO53o5QMoIYZYCMXioG+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J+e2gG9PoTt8mz/HpWhw2WDLYzf0kgc3hIOjqvveYJScGr1q9ipcdK3TC10KuemQ4
	 IxrHunzT8MZeZlmsFFuryAwCautm0lpWXhqb/6ekOGxkg6FeccVdhXhHCj+27SE+ZH
	 9bhEQXOuGz3aUfAF2bZ5BBkS2s6Yj+KjzoWshNBYB1tEfUDOLffotGA/lUbEXL6XxB
	 NrE05Bi8Dl1+Tf3COS25ciOFyH/llzPkL2UflN9wM7OMj2tKPavSrkgml9+qb8MdCC
	 oLWA5sjY15Jxor7EhQbEbrYH75sSjn5LoP+4saCRf2ozwm/dtMPgvDInorpAkh8BpG
	 eqmHiqHbqpvYQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mitchell Levy <levymitchell0@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph
 Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
Subject: Re: [PATCH v4 4/9] rust: percpu: introduce a rust API for static
 per-CPU variables
In-Reply-To: <20251105-rust-percpu-v4-4-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <qnTNWVjAt09EBrHCcZZF0dT5c1s-R5ZYEgxKh7CZq2g9AmrNPsE3I3AtGhovYr8iASOQid3fKrmCgwyEb-2_lA==@protonmail.internalid>
 <20251105-rust-percpu-v4-4-984b1470adcb@gmail.com>
Date: Fri, 14 Nov 2025 15:48:05 +0100
Message-ID: <87pl9k3c2i.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mitchell,

"Mitchell Levy" <levymitchell0@gmail.com> writes:

> Per-CPU variables are an important tool for reducing lock contention,
> especially in systems with many processors. They also provide a
> convenient way to handle data that are logically associated with a
> particular CPU (e.g., the currently running task).
>
> Therefore, add a Rust API to make use of statically-allocated per-CPU
> variables. Add a RAII `CpuGuard` type for disabling CPU preemption.
> Introduce unifying abstractions that can be reused for a Rust API for
> dynamically-allocated per-CPU variables.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

I had to do the following change to make the doctests build when
applying to v6.18-rc5:

commit 47fc7e30ab0fbcc7262b846286b4bae5124d858e
Author: Andreas Hindborg <a.hindborg@kernel.org>
Date:   Fri Nov 14 15:43:47 2025 +0100

    fixup! LIST: [PATCH v4 4/9] rust: percpu: introduce a rust API for static per-CPU variables

diff --git a/rust/kernel/percpu/static_.rs b/rust/kernel/percpu/static_.rs
index 418fc2fa06f20..bf053e260f0c5 100644
--- a/rust/kernel/percpu/static_.rs
+++ b/rust/kernel/percpu/static_.rs
@@ -162,7 +162,7 @@ pub unsafe trait PerCpuSyncMarkerType {
 /// # Example
 /// ```
 /// use kernel::define_per_cpu;
-/// use kernel::percpu::StaticPerCpuSymbol;
+/// use kernel::percpu::{PerCpuSyncMarkerType, StaticPerCpuSymbol};
 ///
 /// define_per_cpu!(pub MY_PERCPU: u64 = 0);
 /// ```



Best regards,
Andreas Hindborg


