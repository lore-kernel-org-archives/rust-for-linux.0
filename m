Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B46495509
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145742; cv=none; b=gKVHxNG+mLZSd6CS52eNVvOdGkU2KYJ21YJ+YVpKCA80LGlSDeQpxP+VShbwWIQm5aM3eaV2BFYuvWuv7AghvYrES5jzk5grr+HbM8+/fkyPCC163ghV8A+QC4l2G8IDbUWFLBmgN0Q+7D3Iyb6iMRMds8MTIx+vJWGT4limn9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145742; c=relaxed/simple;
	bh=L7CrLJMVRfz7b6Mq8AGgo76DRFLIk7+WT8WbD7OBnnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mO+az2PgKf3JG8d7BCwO4qPFFjfTNkz9Oy2xfbL/fKXcMXflsliW7gki/C5ntXhj8uVfU1vZlI6ipPNM9+Kompl1nmdhstBMisli47e0YUH7VFytFH2TXllWgrHu3LJetD1ksB1bewaSjXl14jmXMiacVfgp37XPvq8OT4dNHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=j1/mN7ts; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="j1/mN7ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1784145735; x=1784404935;
	bh=4QqeuF5FUcRt5pFIExp1uYIABYGFvYOct0RfvBryi2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j1/mN7tsc7BUeIEdRM7EQzx9zri2n42/KPuvQ+WuRj+XQw7RXh4p+1yWVEyg9ZWhM
	 VsWRzo4DRZMYP6xxVJdLyJAQBQ4zXnojPCGIfDwJctnfw40e+ZN8b+TRDGMInnJPvX
	 R+BTnE0tgMd48acQzULIDu23OM6QWNoEaBcLZ7EfMNcYB7mggSgWq1MbWJRtYojL1J
	 P2ea+jTzoG1Q2dBoLnNXT9oQvAv87RMVANGDYretM7/cvdATiNE8D5T2qwZWorERr8
	 OVV2g8la2rv7Bbxg74o/OHvh1xvitvpXkabPaW0F/qofOlp5vXQ8OftenB5ghnmSnO
	 3WklqdoF88K7w==
X-Pm-Submission-Id: 4h0nBg2hrLz1DDpB
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <bqe@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v5 3/5] rust: sync: Add abstraction for rcu_barrier()
Date: Wed, 15 Jul 2026 23:01:52 +0300
Message-ID: <20260715200156.47101-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260703073141.3962604-5-phasta@kernel.org>
References: <20260703073141.3962604-2-phasta@kernel.org> <20260703073141.3962604-5-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 03 Jul 2026 09:31:39 +0200=0D
Philipp Stanner <phasta@kernel.org> wrote:=0D
=0D
> rcu_barrier() is a frequently used C function which is always safe to be=
=0D
> called.=0D
> =0D
> Add a safe abstraction for rcu_barrier().=0D
> =0D
> Signed-off-by: Philipp Stanner <phasta@kernel.org>=0D
> ---=0D
>  rust/kernel/sync/rcu.rs | 20 ++++++++++++++++++++=0D
>  1 file changed, 20 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs=0D
> index a32bef6e490b..7031ca5d2473 100644=0D
> --- a/rust/kernel/sync/rcu.rs=0D
> +++ b/rust/kernel/sync/rcu.rs=0D
> @@ -50,3 +50,23 @@ fn drop(&mut self) {=0D
>  pub fn read_lock() -> Guard {=0D
>      Guard::new()=0D
>  }=0D
> +=0D
> +/// Wait until all in-flight call_rcu() callbacks complete.=0D
> +///=0D
> +/// Note that this primitive does not necessarily wait for an RCU grace =
period=0D
> +/// to complete.  For example, if there are no RCU callbacks queued anyw=
here=0D
> +/// in the system, then rcu_barrier() is within its rights to return=0D
> +/// immediately, without waiting for anything, much less an RCU grace pe=
riod.=0D
> +/// In fact, rcu_barrier() will normally not result in any RCU grace per=
iods=0D
> +/// beyond those that were already destined to be executed.=0D
> +///=0D
> +/// In kernels built with CONFIG_RCU_LAZY=3Dy, this function also hurrie=
s all=0D
> +/// pending lazy RCU callbacks.=0D
> +///=0D
> +/// Note that this is one of the RCU primitives which must not be called=
 in=0D
> +/// atomic context.=0D
> +#[inline]=0D
> +pub fn rcu_barrier() {=0D
> +    // SAFETY: `rcu_barrier()` is always safe to be called. It just migh=
t wait for a grace period.=0D
> +    unsafe { bindings::rcu_barrier() };=0D
> +}=0D
> -- =0D
> 2.54.0=0D
> =0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
