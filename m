Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED5488D84
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939159; cv=none; b=bZ1mmQB5ouqpQ2d1XY8sDboUCZDjrH+YgcQR4L25SX0/RI0uX0h9EZ8nBAy8Fk146R/ZbEPCv3KVmQA297IM0sk7USxjB4ND/IIHpyFC8IhUtqhsTIetZYjjuC94dX1P1m1r/Ua7pZDAgUrnQ6mHJcAl1AZrx+nKy17q+prDI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939159; c=relaxed/simple;
	bh=7Z8sWXwwNJIxbNLxy5AX5UPsuMIafoov1tbsywJfsws=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jmbOCe3qn1xmh6F/N/y6ETpxzLPyiWf4k554AYTA1Xs2eqkk15gspvohlrTAEr12/fMFlsj/Nb+K179tGQAYd0bjk8GsFexEegg7xQcTZqLrY+SOZ4lKrMmX5p8qqKTs4Gpk1s4OPuemgj1AWk+9bPTUx9b5iYFGR2JMS/B32tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=F/R8x1bm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TLJN0k7k; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="F/R8x1bm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TLJN0k7k"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D3B98EC02F5
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:05:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 02 Oct 2026 07:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790939156;
	 x=1791025556; bh=mHfIE1PdUETfcBRK2SrKTFbFBxMeRCpW8zHoPE8vrds=; b=
	F/R8x1bmXcI+l4M+9aXt5uNsIHBO3TGoOYPiSyl7ld7ilWbFkh0ds7rl5wm/KVPk
	+X0+SIFFJX4n31ZFjfOScMiCqvcgfHfPafAW67enW3yqPEcYbDumCVPSpNZezbAr
	UAsWc+JRu9rKzXma22XanPQ/Igv0EI//dYZg7d4uhnykzWSFM+EebGhXLWShyUsW
	G0WGrRuQp6T8FWAPg6PZKHltc/Hj8//bI/7XA8QkdnodnRbfWh1Yn83rjhfmuxcm
	Na1NvqFx7Qpyvh7JmF6YNZyzUm2gNYh7lC3gL1eCZlhW31V26ElZIp8CZ200gM9A
	xZZ3zUjH8cskiGeLE+T31w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790939156; x=
	1791025556; bh=mHfIE1PdUETfcBRK2SrKTFbFBxMeRCpW8zHoPE8vrds=; b=T
	LJN0k7kBrVygW731JX33hxJbMF37bhErk+LRCMTI4SnSdjS26ggofBNHz1w+l4nM
	5sD91N/8+rWiBPFcfq4JIvkU+Hn93COR89jqaRFFxpNjaMwnShkvuHBYtTpgvElc
	+av6Kd7h4gC5i/RNiGEEATo+bOq+NcVIZNo4LcZOXOdK1yDc/Xk+te4pFE/x3nej
	0Tvy88W1VgTPsWjY8CSGQyCxKYEa4u2U1ikziq3KCbXyXEXOL6TtCMkh58RFwHbO
	Z6KAhjs9QmtJME82WL4R7gN4h9C1nv2/FyEtgZWxUA98InQm7JUBN0mbKD4spK9J
	x7yOmI1TU3n4F2M0QeoDw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790939156; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:B6ueugDMiqMlczsb141CvBYQp/ak9p41kpuKvJkJT5SwgMu
	kCzm/r5894+jMfNHmNujGSwIjZoIRNGmPrEUdJV5M2xZWvCB5aCF4WZ/Vn7EAdzz
	+bp1zwz5xFLpzHJ8odnT2EsN5WYbgzKfHyfLE6DBuaD+V+8ird6JoTd/FwT9VwpP
	zdY7rI13zI7htOpQBoCLBVbgU5X4KlqXUEp0AdszuUYUNjt1M08WpkKZlp7X6tvd
	y1dhnZjM+GeXdcHWPo5XHmOMrL1jjt8PKZji3PrWbFDISa9q2Mub1jYRVXC4k+VX
	allLIaEWtlDo16ZuKwcMdtKlx/aAKtOtL8CLtwA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:23s8YZAz+n69FALscZECeLT231KsK1iXmmclqwBOEgw=:7Z8sWXwwNJIxbNLxy5AX5UPsuMIafoov1tbsywJfsws=;
X-ME-Sender: <xms:FJC_ak9nfK31A9OGA2hOrUbZm6zywH2oRyLWxhcK5-G_ZRXoLU52mQ>
    <xme:FJC_amV66N2Se-jjYhhadiQNidynd-itvoZ2TuHYwA6a0U62S2cmlD_6tM_Kfh_or
    YK3J55tTYfujhSwKryUIhgbpAktLPPYF70rJXNS3X-M1qM3iTTmrfV9>
X-ME-Received: <xmr:FJC_atdCdPGUJxdDxLQkDQacgnUAj9LtJXkx6Bphlo0HLYOIlTSWhHwg_VQ1-1vY-cEbrzrzN1LEQ0Y4pNA2jbxR>
X-ME-Proxy-Cause: dmFkZTFcJxAJtgSPQGpwkrMGQfulNkO9fzKJz/g8Eqlz/ucHzERuzvRAsVlZkC33IsEHIw
    U0D5F/d/sCJcQy+2p8F080G7EJ5XMz8IuRWSZND/yv02MXCLlGLlOPb7ZQAT5T9mVOM4Lx
    vrKHU11d5Z1pvCSkl8q+CjcGIWXyYVRfqd19zTD0etNRass5MQ+cr8VcO0WVnuKTRelehI
    YL2vB9VVz2T64LikzwgCuqS9MV3s1P483pkerbrqpAG2KoybTasSKEYo4nWvVeQZb2rw6y
    KmFAcb5fcFT5na0BdazB4JMsRqHSfe6oIckgOpjHNAr4l6uUjHOyieWta9nGGM635B9iIr
    BWAzHfbDWKQvM709Wg+r2XkLKwom04sAnZaPelPuwdPNHVTBGnHvDQyYpcVvMyzPO24Rfh
    j0qo8z7fYDXZQlEm4zSJ+5Bo2gEMZhFqQXXD7cBwKoHtSgdBNdqTpRGCmGOkueZZJUnWgr
    PZhiu3We55EO9OChyZUWmauzqHkE7K9hGxxvOrOH9px+SOBUi3fFLpZYUUP+dDgYIM/+3u
    EDTN4s0e8DlXHzOr2DN0KQtiCJSGHqYnWK3OTS2F5bMF6CP3MwhRONbjt1n5Hr3Ebu21kU
    uSMM3VvgqTTE09a/VtXKyiPBKWrSnxpA/74V1fKo/0luRdYWoT4s414ce5mw
X-ME-Proxy: <xmx:FJC_arV_ycBZrpw3c_ypF05vKk4XT8K-eqHavBcC1rfl0edJgU08AQ>
    <xmx:FJC_akVcOsqK1n6rjyFea6FC9WFMWcuYJez-2QQwP4bEgv9JbzZAXg>
    <xmx:FJC_arOGUAPaKzdfBZOZ-3ilkfIKqMD43qXDNGWJCw4myh00Eh_pSQ>
    <xmx:FJC_an7aa4PTLzpRUk1Rti1_zLLpjRhcn84rFY9fzJmwoluGXlRKng>
    <xmx:FJC_au-Ps1_OsKFS-Q5IEJ0PwJ1pyy3dDvl8_Ohpwen76CZQxbfkV2H8>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 07:05:49 -0400 (EDT)
Date: Fri, 02 Oct 2026 20:05:45 +0900 (JST)
Message-Id: <20261002.200545.48892805627139274.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tj@kernel.org, tkjos@android.com, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, jiangshanlai@gmail.com,
 markus.probst@posteo.de, fujita.tomonori@gmail.com
Subject: Re: [PATCH v8 4/4] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLU9K3JPSWCD.36FZ6DPB6B3NQ@garyguo.net>
References: <20261002050428.2746277-1-tomo@flapping.org>
	<20261002050428.2746277-5-tomo@flapping.org>
	<DLU9K3JPSWCD.36FZ6DPB6B3NQ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 02 Oct 2026 11:00:40 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Fri Oct 2, 2026 at 6:04 AM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>

[...]

>> @@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
>>      /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
>>      /// thread to sleep. It wakes up when notified by [`CondVar::notify_one`] or
>>      /// [`CondVar::notify_all`], or when a timeout occurs, or when the thread receives a signal.
>> +    ///
>> +    /// A negative timeout is treated as zero.
>>      #[must_use = "wait_interruptible_timeout returns if a signal is pending, so the caller must check the return value"]
>>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>>          &self,
>>          guard: &mut Guard<'_, T, B>,
>> -        jiffies: Jiffies,
>> +        delta: Delta<Jiffy>,
>>      ) -> CondVarTimeoutResult {
>> -        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
>> -        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
>> +        let jiffies = delta.as_jiffies();
>> +        let res = self.wait_internal(
>> +            TASK_INTERRUPTIBLE,
>> +            guard,
>> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
> 
> I suppose this can be `delta.as_jiffies_unsigned()` too, although the clamp
> makes it more explicit?

wait_internal() takes isize, so with as_jiffies_unsigned() we
need to cast the value back:

| // CAST: `as_jiffies_unsigned()` returns at most `isize::MAX`, so the
| // value fits in `isize`.
| let jiffies = delta.as_jiffies_unsigned() as isize;
| let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);

The clamp needs no cast, so I'd keep it.
