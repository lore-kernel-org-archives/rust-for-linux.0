Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52026374745;
	Fri,  2 Oct 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923271; cv=none; b=W8RGvKZy1zlNUdGjLYqQfgAVmhKYZp+j22Dc4+Qu2jZ3bNqXQwbBvzXfuy9eaAmlurEiTR1WnXMuY4sqxXpLSKwCNgUbcS1r85tuu+W5UsFCV7WB3rai9UGt0jR4/EX/UeMokKaKcXtcDjsTw/TnffSCXCLwqTOq+BHsKt+cdLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923271; c=relaxed/simple;
	bh=3ukon9UjGZhYhSen+wuwN6tobsgj6SsTdR1zHEwrRj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI3tTq+cG+Iyt1IHdAQV4pLB8bpKZ5eBSREbJKXjOo/rFZ6NJkzsV1yzQFLcqmStLXaEr3K7XEDGgBht5/r1VOxvMhpSwY5d5/Tgl2xsk2X4z2Jv9m9drqVzYfo8Ckw8bzxOI9TZPXzcLfHXVmHsiMYQMwsFI0KI3IAkA/u0nZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X313/39I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X313/39I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED351F00898;
	Fri,  2 Oct 2026 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790923270;
	bh=IhUgpix7xqUPicOrrlGZirp6Yh2QlMxihSKlR8JCZck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X313/39I+CHHLC+DEn36PqxdIscKTcoxR5dss6fYXg+3LXIooaM7DCuaK00C5Xf7I
	 zvQ9zVPQxcNWGLcNYKr4pQO5eZeDa6HMYrX/08/GdaB8nKWC5cOkQLQ1HsSgZaQtal
	 D5m4dI3UqLqn+mwFKp8Z1CD4awpH4PwJwUtODFEOQdQw0anExaSpuXArnuifoeHHf+
	 qDDIkmbNhYK5w7JJIvbd4OIBq5wDGqO985m/djuwj788ALluPq2DbNdzdCFeicOk2j
	 iJnV2A3OzJHgzqPHvTnW8YLLmuQJ0WRAG/5TYpMeLjcJLGtY1ZQbKyWHyJ5sIAhOWs
	 1G7mWDiCEq9UQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 95DCBF40066;
	Fri,  2 Oct 2026 02:41:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 02 Oct 2026 02:41:08 -0400
X-ME-Sender: <xms:BFK_ak4rmKBhA8M-Em75zaLCPm1zOAa5hFsgYvKsFmeQ4Pi8LkjeLw>
    <xme:BFK_agldQMo5s2N27Y0tZOtnnuDAKNaosE-YST9obBjNManQD0LF93KDIUY0mdZil
    yWNNsPxgmJsvZ5OIabYc9ZGz5KQ7s4n7ADhpPDzOTCSaFozYd3sZYo>
X-ME-Received: <xmr:BFK_aqFlCZA06jt2nydF3QM_wv9mRRCyVHzHXu1Z29zAKH2GyLg-Mx9Drhbp>
X-ME-Proxy-Cause: dmFkZTEHFJhaZmLEauJMdy0kYirbHtJH7W/2A+pNR083/LKuCOf2RN/fB+JVqOoJcqmanD
    ejo5l9o4R2pYo+Ixzdf33xBKfGxMLENJ0sEAOdAfjiXBuaF8wJrJ7kcBGKSZPQ3KDQcy3N
    b0ocSwV/gvC9erre9ortZCjBRjRLlE3NUw3fOAlcY7UfB19G6Wo1HEWi7d6G3aUng4PODe
    Uzt4WD7XPd9y6k3zdcZ1SjbYnmu8wInrfg32D0xtQm/EQx6sTy1n+ZNharshwqcPZflWOQ
    ShhjHSzqEKhR+U6ood6e9SthlIp8+QaIo3JAXUJDV1gucPBkcWW0c5voMIBq4qwJjo/AYM
    j5b+xKJ6S9P+2B2OVfw8OTlW5UjN77ojfRkfExkkUApWzK18AOey3QzuE2XVlLLYBtHV3l
    uQcEP63FOJstxfKZeNTo6J5Z9ZiaQbgjeNktY4TkROQ2cPINapm8k1J2HZeXWTUBkgepBz
    aXL1WRkkrvsHvoooFuVqfbAjFeqwql1y6ZLJ3wAPzTASnm6mTX4KiHdwrSuEbThacA/aa6
    +H+v+2iwEWwZwedkyA6x7UC2Wh88xhYtIfIpp6JvyvhCsd+t1tV1NWi0x/pfAada+I+VVP
    tgLHaCh0ep2t2YBVvbw+x7yCLl4ksK6VROzk8wTofv1XRcSc5hxmIzUCcB4A
X-ME-Proxy: <xmx:BFK_akGH47ArCuTVVdpZuBedgrlUGVp6we97sJs62RwOBwEBWQqduw>
    <xmx:BFK_ai0c8BTw1LaJw2BaIqjqsszdAty2Nbea0SoTA3js_Dp_sO09lg>
    <xmx:BFK_amcEIwXIr4NQ_ruaL1Jj0sK4u0g_QNLQgjrXBrfdIW_E37FNlQ>
    <xmx:BFK_akIpiKIEVg_8UPGRYuedqmBBGDxJ0IaCjWpa8ySHBWTGeDqrfw>
    <xmx:BFK_asGT2dFppR6J05orqB8-gwvFgkChOAie8P3KT7yFEsZpUp4pK7eU>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 02:41:08 -0400 (EDT)
Date: Fri, 2 Oct 2026 08:41:06 +0200
From: Boqun Feng <boqun@kernel.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [PATCH v2 3/5] selftests/bpf: Use the new NMI_BITS definition
Message-ID: <ar9SAuIQ8RAp4GsG@MacBook-0RXW5>
References: <20261001082519.16195-1-boqun@kernel.org>
 <20261001082519.16195-4-boqun@kernel.org>
 <ar5cbL_ywJVP9m_s@MacBook-0RXW5>
 <ffd241f1-3f75-44c6-93b1-1482b7a17a5b@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffd241f1-3f75-44c6-93b1-1482b7a17a5b@linux.dev>

On Fri, Oct 02, 2026 at 02:24:11PM +0800, Leon Hwang wrote:
> On 1/10/26 21:13, Boqun Feng wrote:
> > On Thu, Oct 01, 2026 at 10:25:17AM +0200, Boqun Feng wrote:
> >> The definition of NMI_BITS was out of sync after the introduction of
> >> HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.
> >>
> >> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> >> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> >> Signed-off-by: Boqun Feng <boqun@kernel.org>
> >> ---
> >>  tools/testing/selftests/bpf/bpf_experimental.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> >> index 2893bf06ff25..4bf7390994bf 100644
> >> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> >> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> > 
> > Per sashiko's report, seems I need the following to make it work:
> 
> Sashiko is correct.
> 
> BPF compilation context is different from kernel compilation context. It
> cannot directly use
> IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)) when compiling BPF
> objects.
> 
> > 
> > diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> > index 4bf7390994bf..94143cf0ab0d 100644
> > --- a/tools/testing/selftests/bpf/bpf_experimental.h
> > +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> > @@ -367,6 +367,9 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
> >  extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
> >                                struct bpf_dynptr *value_p) __weak __ksym;
> > 
> > +extern bool CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS __kconfig __weak;
> > +#define IS_ENABLED(cfg) (cfg)
> 
> Correct.
> 
> IS_ENABLED is unnecessary here.
> 
> The below patch passed the BPF ci [1].
> 
> [1] https://github.com/kernel-patches/bpf/pull/14197
> 

Thanks for the testing. I know that IS_ENABLED is not unnecessary, but I
put it there to make NMI_BITS definition stay the same as
include/linux/preempt.h.

> > +
> >  #define PREEMPT_BITS   8
> >  #define SOFTIRQ_BITS   8
> >  #define HARDIRQ_DISABLE_BITS   8
> > 
> > ?
> > 
> > [Cc Leon and Alexi]
> 
> Please cc BPF list, BPF maintainers, and me when respinning.
> 

Sure, will do.

Regards,
Boqun

> Thanks,
> Leon
> 
> > 
> > Regards,
> > Boqun
> > 
> ---
> 
> From 4c1b9a6f6404aa25d1d300465dba4bee9a139668 Mon Sep 17 00:00:00 2001
> From: Boqun Feng <boqun@kernel.org>
> Date: Thu, 1 Oct 2026 10:25:17 +0200
> Subject: [PATCH 1/3] selftests/bpf: Use the new NMI_BITS definition
> 
> The definition of NMI_BITS was out of sync after the introduction of
> HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.
> 
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
>  tools/testing/selftests/bpf/bpf_experimental.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h
> b/tools/testing/selftests/bpf/bpf_experimental.h
> index 2893bf06ff25..b567a48f1dce 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -367,11 +367,13 @@ extern int bpf_cgroup_read_xattr(struct cgroup
> *cgroup, const char *name__str,
>  extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
>  			       struct bpf_dynptr *value_p) __weak __ksym;
> 
> +extern bool CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS __weak __kconfig;
> +
>  #define PREEMPT_BITS	8
>  #define SOFTIRQ_BITS	8
>  #define HARDIRQ_DISABLE_BITS	8
>  #define HARDIRQ_BITS	4
> -#define NMI_BITS	1
> +#define NMI_BITS	(1 + 3*CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
> 
>  #define PREEMPT_SHIFT	0
>  #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> -- 
> 2.55.0
> 
> 
