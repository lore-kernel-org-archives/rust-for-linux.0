Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AC330310;
	Fri, 14 Nov 2025 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133539; cv=none; b=cLzeIvc/W+pVCUAJwsPjmb0RKCy+KsgbSyWkLtgUK/4F1XTuHb8IdCqlOsDqUbOgzIdvlLDR1xcerqJOluUPH3VP/pnZu+VuhVzExO8k530BVuL4hQP5hBK1kq+CC3F92Q+1W0UHkgQgJ8NLuPceXMuNB1HEz5CS4AC1Ga8fVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133539; c=relaxed/simple;
	bh=Q7AbNtbSF2oUgYwfiHMSGel7cR2NLanBud5yyhRwB5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HSUsNAN7gf2+CAKlViWocXEsgoDYGwwY+rVFxoGL04EtcW9FuoarwxPQxkJHPr7CYIKnvOrlOBXfFur23nxIHJt8Ppvi2WgMlX5/YzT7r+YzTxZTcORJr3tefkJvIjMx/doTsR+5evrWON9RcQ89+oLP0fdHsWOORxc0ZRMUTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyPfeDpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyPfeDpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CFDC4CEFB;
	Fri, 14 Nov 2025 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133538;
	bh=Q7AbNtbSF2oUgYwfiHMSGel7cR2NLanBud5yyhRwB5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RyPfeDpXgdma8ly5nBSnAOq7bTR3bx+1HzamCgl4PbcCEMCz8QwFVr1XZ+1uO3PKn
	 2ucnRdF/OtluPexvPzApZfxV25Su8GWgb6oYZ4X9eBTuCMgxWyQjn/YV7bur+A53v5
	 7PQgitDLCRG7jW/wsH61M0y9dP4+J2op6YcmZQ6pGzlolUAMM39itAsKqZovcqwlHr
	 jDCAnKLQ5Gv8/FplaM914qSyHUXlPv4W6DClKc7WqWv3ijSMazklXjXWLWBjmUYM+S
	 c9KRa3foVW/Q1QeB3y0qVu2zEkuNhPvy1tDL0RInVUKjdErDj/c/0V+FN+2PDp/2gq
	 4vg+oGPQfV24g==
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
Subject: Re: [PATCH v4 7/9] rust: percpu: Support non-zeroable types for
 DynamicPerCpu
In-Reply-To: <20251105-rust-percpu-v4-7-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <UXz9LMnhHE_mSMj1Dt_6wr3bB7I0jmR6ynJ2h8pSSiyeusmfuHXPFk5UVOYajJqnW2xhCubkwiRlUU5Q1jFFig==@protonmail.internalid>
 <20251105-rust-percpu-v4-7-984b1470adcb@gmail.com>
Date: Fri, 14 Nov 2025 16:18:45 +0100
Message-ID: <87ms4o3ane.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mitchell Levy" <levymitchell0@gmail.com> writes:

> Add functionality to `PerCpuPtr` to compute pointers to per-CPU variable
> slots on other CPUs. Use this facility to initialize per-CPU variables
> on all possible CPUs when a dynamic per-CPU variable is created with a
> non-zeroable type. Since `RefCell` and other `Cell`-like types fall into
> this category, `impl CheckedPerCpu` on `DynamicPerCpu` for these
> `InteriorMutable` types since they can now be used. Add examples of
> these usages to `samples/rust/rust_percpu.rs`. Add a test to ensure
> dynamic per-CPU variables properly drop their contents, done here since
> non-trivially dropped types often aren't `Zeroable`.
>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/kernel/percpu/dynamic.rs |  44 +++++++++++++++++
>  samples/rust/rust_percpu.rs   | 109 +++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 146 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
> index 1863f31a2817..a74c8841aeb2 100644
> --- a/rust/kernel/percpu/dynamic.rs
> +++ b/rust/kernel/percpu/dynamic.rs
> @@ -89,6 +89,36 @@ pub fn new_zero(flags: Flags) -> Option<Self> {
>      }
>  }
>
> +impl<T: Clone> DynamicPerCpu<T> {
> +    /// Allocates a new per-CPU variable
> +    ///
> +    /// # Arguments
> +    /// * `val` - The initial value of the per-CPU variable on all CPUs.
> +    /// * `flags` - Flags used to allocate an [`Arc`] that keeps track of the underlying
> +    ///   [`PerCpuAllocation`].
> +    pub fn new_with(val: &T, flags: Flags) -> Option<Self> {

It would be great to be able to pass a closure here that can be used to
populate the value. Then the value does not have to be `Clone`.


Best regards,
Andreas Hindborg



