Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD74734FD
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860402; cv=none; b=qGVHi+bXWNx6okWmSTnUQLzVFL5Mwi745qwxQLwmjZKN2xplMVq70TV8xuWOR68kcCbqNGMIBn5X39QO78YkRhIpZDXE+lZ5XLQz4CU8zDMZaSCj7XzzDP2nmEglRzmdXanYXZ+LfKsYzYOL7aOpxN+bXzWfofa2A+r0SlpoW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860402; c=relaxed/simple;
	bh=6xbb45Cd7qX8d6Lsscqf/5XrdOkBiBVDs4ulJEDEk5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFWGfBl32vz9aKBCxWjhTSCCuxaQaBGdu7Ta8VI0a8aDt9beOPnfFb7b1YcqPUnHq+iElFZ/lyLMLbweR8J+7gLKlewWAwJN0dX+eyzphlmt+gkjkB6iGSM3ApCatfxS5TsDNQgUDcKaWJkX4ysTdofr/PobzW508lWUFZsMobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qh4zaeIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qh4zaeIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514FF1F0089A;
	Thu,  1 Oct 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860400;
	bh=0n5tH4utl+lNJ2Z0WOsD+MvspE1oa6n6hfh8YYdfuHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qh4zaeIqcFKK7k9mefOiVqI0yF8eCB9wgs49rrCJOlPgYEBN6X+6TU+5sthlg8wpY
	 xCUor/n3qfh7vbn9MI1IqbUZB4+YiH4vyMa1XhwYfj0v6c+8gS6BXvCVAYmr4U/St6
	 wvsOiBjSrSZx3Jgnp8rq+m0JRnWAncx6mqrfuJFOO9tskS0AIUNIi4K/JNP8gVOZst
	 NoT5r8rX7zqvCCWf5Btdo/xj5NzaqC2Hsojk2CGqoK7cph2n0P1Ky9eLQRmMD/8A1E
	 0M4I881dNSVqVPVJrhjG2IA8EJIJGmHcavV95SopTi75ZvfFShaLrJ+o0ftppK2czt
	 gHxlFQUuIfesA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 51F05F40066;
	Thu,  1 Oct 2026 09:13:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 09:13:19 -0400
X-ME-Sender: <xms:b1y-anmo1UpaRpYg6XRqP2CPnR2kxCSda4ELj__J99O3aIaa6kezBw>
    <xme:b1y-alhKhzKUw2tufLoXpPBmJB8G387XCzm9VQx4uTip6RAsgeSQNkAk7Hfkj6dk_
    xJLZtk91FeK4LWQPHRfK8iZSmQ_yu0reXBmW-HmcDp5brTRGTr0>
X-ME-Received: <xmr:b1y-akRqRfbuoWVpGPl0yqJfSdG0hEmfLRmGN0Vd9M6l7gNIXH_e8CcNXAOF>
X-ME-Proxy-Cause: dmFkZTEDz/wPL61bnt0xT9qymFFCo40y1dH7QHJB0l82uOK/MZKSQe0FLWhrl+2yMWu8AT
    +cCg5xLoYp1mcYyPJfy5VbLnSfJRXO83x7jG6igLfGRJVc96mxfn76jlDv9wc0xfSP0Q41
    emqek1MoR3KVqHdbPw5mFuUc1nAniVZbdgAJkHGhO2uhtfqz2Y//0FWyLIX5b8LI5OpsXi
    8YNsqg7wrdLeoumDnnS/OK9iY/rygeWhCwwGcEMM6iBiV5ZfXdr9dhlNN3f0a4CULVLGqv
    A0DqacRPXQ1rT11HjJXAI5SKiOYyLtqDTvpIaYW0hVdhu7Zio7M9irLe4KGeMA9xi1yCq7
    U4GB70ugXTFdSNePDPxVyVBiUerGOEZO4wZ5oqUQT5gavVPr9xoFfGbJ/TQljdd33oDEDp
    qTgPvXZtGv8sJ4v6JWabNIHcyck7A5Ha3LMJo4FWXx0nSOWcHXgDwaeGYnf1oMSTLZjqvE
    geD2xJeSixOcrqGScdqY/wUNb0X2nPJ2GU48XACQZLgc0fXF2/FROAaFpfp3+lBGK5dA4b
    YeGF7S8Eq74bBTvKj88Ocqs8u7B8N5M8/BDrdGbsVycfQe1cNchmcke1zJ3HG5R2J+WGaa
    i4Zqh1imKLkoVe/kosj9lCwKLZVTIgiJwZP9ATwxzjV6aYK8Ndz0keAh/L0g
X-ME-Proxy: <xmx:b1y-aqjy38RU21ia2Is7TNv-A_QXMzUIM3GhSKVk0kf0je6YWIi4Lw>
    <xmx:b1y-aghh3LQ4KY1aR3EQnRU2eKzBStxuEaHZNco3jLqaFgL2jpcDDw>
    <xmx:b1y-aqYXfcYdxs5drgypvLOTTYDWan0Bf6z7AAHodoTcDKtQn_XxJg>
    <xmx:b1y-ahX1QEPKaD71V-v9hg5Elp2OY8HyGZPZZLtdOge6TW_a1K5qXg>
    <xmx:b1y-apjuKyj_MYeFMCfgu8Wdi02gDL0rb5_rVb1Xihwy3AGo32JxtIQw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 09:13:18 -0400 (EDT)
Date: Thu, 1 Oct 2026 15:13:16 +0200
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [PATCH v2 3/5] selftests/bpf: Use the new NMI_BITS definition
Message-ID: <ar5cbL_ywJVP9m_s@MacBook-0RXW5>
References: <20261001082519.16195-1-boqun@kernel.org>
 <20261001082519.16195-4-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001082519.16195-4-boqun@kernel.org>

On Thu, Oct 01, 2026 at 10:25:17AM +0200, Boqun Feng wrote:
> The definition of NMI_BITS was out of sync after the introduction of
> HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.
> 
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
>  tools/testing/selftests/bpf/bpf_experimental.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 2893bf06ff25..4bf7390994bf 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h

Per sashiko's report, seems I need the following to make it work:

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 4bf7390994bf..94143cf0ab0d 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -367,6 +367,9 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
                               struct bpf_dynptr *value_p) __weak __ksym;

+extern bool CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS __kconfig __weak;
+#define IS_ENABLED(cfg) (cfg)
+
 #define PREEMPT_BITS   8
 #define SOFTIRQ_BITS   8
 #define HARDIRQ_DISABLE_BITS   8

?

[Cc Leon and Alexi]

Regards,
Boqun

> @@ -371,7 +371,7 @@ extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
>  #define SOFTIRQ_BITS	8
>  #define HARDIRQ_DISABLE_BITS	8
>  #define HARDIRQ_BITS	4
> -#define NMI_BITS	1
> +#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
>  
>  #define PREEMPT_SHIFT	0
>  #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> -- 
> 2.51.0
> 
