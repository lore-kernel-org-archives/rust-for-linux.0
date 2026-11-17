Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917641;
	b=rTgyeTdzys6LIksX683LWMqI8aKTiYLFi44EMhyUQbfczivI6e47Wgj2tL0/m4C1/q/g
	 mZpjoQktn+N13ttcRjx/kNAGXwVAgb9MO6xjxDj49/veXOqoyhm8LnLEqW6i7BE9jYy1g
	 M7p8LmamMi0RBYv3+LirsHC4N8EOYM9Xyt+Z+mYUH7/FhhKzeICit+5HHw1rRR9JF8sgM
	 VTVm/BKXWFoH19xF+46kvnr4eLQgyPo3HPT79u4QG8NGG2NdwuCs/KazXgaxG/tEKziDy
	 orqBCTGFwFRU7euWjr4pHMqNyLmMPsibXg91yxJv/nGhuwSld2GzDbxMBvy+YhDHi+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y++1Wavi5PfkK91BOonn7B+SnWiYUO26OMI1ZSdPakU=;
	b=c8IXMGw1TegYi09OrPKIE9QcOln13iiIbxi7AiLYOKetUjyskMmMcp+fRF2BoTCMVM94
	 Y0QfIm75sRqDrNCI9HTDwhjq+9/xdO7KLmQS1XvvlXfUP22iz+s454Rtao3+guxOI3ZpR
	 0S3pFduAF8LJAE8unN6GUdHGatfc/29Eo/a/lZ7k4vvcQgn47SOIhuxfpH1yB2WABalTX
	 qlNJ4/D/AmD4bsKj/dUr/eF1cmCVXBgShYr6TG4FMkHiIo2lf1hsWUIhqrMxBs+dZadNU
	 VpozmoT62WyIofJPflj9LYSzaz5DOH8GkqrMnkIdEe6BCFzc0ZZUT8FdKHwgXYogVjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YWwoM8uv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC469606A31C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 12:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC469606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YWwoM8uv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47558335e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 04:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917639; cv=none;
        d=google.com; s=arc-20260327;
        b=PwktVC+B7nCbpOZ4UoH3RRhFLym0erA+Z+/FCeKJ6YqnTzWwJU8gbn3colldOBLVni
         D+F+4XhrItjwOYASAKWT8oBHrCbOz9cNfN9RaUY4UMn7BbuW9Ko6ZGvK/+WPRWNKPyon
         kc37BtXfMg8rGxUJ46gPd90nziz70aL6zvGjnQcxUQncuYZYKY+38RvRctQZbIY/zk2e
         HyYUvg6LEIMpXYV/fz0M7pQi1duVNejwGxTsryb2SE2SFriIqYC/VuDykoaaDAriTMqx
         dslIUnF4Kh5StKkDh6qyXHx35sLRHw9Hqx2o7q6j5U933BWSizPKZXf0SBHQeRVTukpG
         ANFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y++1Wavi5PfkK91BOonn7B+SnWiYUO26OMI1ZSdPakU=;
        fh=UxkWGocrTp2+/cQlq8ZqIFZR5gx6MsdK+ET2ytz7hNE=;
        b=pQVBQQ+2MdZr0AEo72Tk1hzgGwiZHPD70F5OE/4XkZFSKLOiLYHzADB/IYLuUb2xI4
         QC+7dlE3MpVgA9ffvcRrE48lF0khfprEZ0Dmfydmxkc2D/+KidvxQc9S0Gs7myWrXxVD
         HnA7FrXG+qV04OztHd1kNUny4S8gUf/aQ95txP8VbLsp3/L4WrzPkTaK5GzA0EXnTryM
         fw345bUz1ZeIFYMkusP3AtAc2UFY7QogC9mkW4NSd3idtxsE9xMHzmGmExADnhTDqrWA
         KmPvW1HSxKoQx+OsMYM3ivIVJ40wZxjAbB4y/Dn7FCYA7L6t5ah1dEGkqvblZJAm0LG+
         RDoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794917639; x=1795522439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y++1Wavi5PfkK91BOonn7B+SnWiYUO26OMI1ZSdPakU=;
        b=YWwoM8uvbdFbEBKO0Yk9Iu0GeDk26eKL0JZEVgVASbcRPPhKDI+ax8CwgC8jKKhdze
         15EIBeJk3KjsUw4zaWCrhyIDkz4t+BQyoD5ReC555uf3CV43NFFzCtEWY71wEApN8y1Z
         O8Uz97QcfMMJm2vmtnj1M59mBe3zvcGlAL/xNtIDUNYzmLXNm8qvCR/SmLmJ4IUuH2sH
         vXJlDkY3DQuqIIHCbjJI/A27xlPfT3hYbD33fXW2CIMByR/+muBY9wCqt8TBk8Sp0rpO
         wOtnoZphQ5MN8Tq13gTbqer69Num3m73CmdBqnU9vjP5eCI6LtogIpRrgDgsSQmDUvKL
         Te5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917639; x=1795522439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y++1Wavi5PfkK91BOonn7B+SnWiYUO26OMI1ZSdPakU=;
        b=to7y3ECzdixTaYcHfLJdqo4zmrPZYH1Q1DeopqSIuXMAB2hh60o+N4+USoqwBptFpz
         CHviztI+uETasb5JUB8fRX2wnguxxIngbktmGaCrx91M4T2ezY6IG9gWWiXfcn3c3Ptn
         Ra9DtEGbz/vfIIh3kc8CBy+NMeJmD4cLXowPjbDuyTt08lk4aH/FwaCGlRqeUtxs3Eg5
         OT5FcRkxb4+kb2mucy+sNXIJNRJ2Qr0ZnLYU2HbXJACx3ifSxMWP/Dtp0EGiK4tEeDV6
         hTD0HzOM3+4sXXl7WIHCUo/ifR42JRMnsmlpaBEsCSij2Wj2CcGgMzgdNg1kJ0N7eqQw
         EF5w==
X-Forwarded-Encrypted: i=1; AL+hErGvoGRTDo42pkIzO/Q4zMCZLmpnJDFebQoPeiID4I02CbRmAIVcAPBdVQ54ZX9V3/xFY99vr+UMth82+q7ynA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wP5nyzVzb3QDLbFkJDS6/jXeRudRKZtiRftDRFm7YFThzuEtF
	YT3GSKYmnj2IWKBrrssbftySSZLT0eaT4BQLNBge+UAvNJa02peqSR+gygWvRPMo+HhhswmgQnU
	tXb3rNDKODxAeERCElgqaxlKQYc7gRtSA0ls6K2dY
X-Gm-Gg: AYBFou1zQZQ29ed9v9auSIrjELD52jlkKpxxKxKbII4jzautMz4jzn6MkhF54YLYX1n
	JJNk6Gmi8e5OCDVTkVOvFyDCsNAzKzizHpJRFTNjGIKw6DX84HOhRX4jVjwM+/2GVKgRtWu0Byg
	aK5ph5qwfXR/N9iqRocUEK19O80sajSRKdSjZAGc9JxiCpCdg/ihKJ0lNZ2AY4KU0YidnQT0bHT
	8yTdr1T2QYf5DG+zovV8uvGmNBdbFOsKpOuW3gjn4RaIH0juBnhaiwJlR9kn3gr4zqTh8vNLjjj
	f+PMVJ+htLJtwZ3eqXaIELIz+ev+uDakcIa0JELwO0ho267tggQzWsNb4W0F5BFfKMMz1jmPeI3
	w+U5ZlA/2mkgi5A5BOKT4eyJH8No6sMwzin0WonVrOyHXQB9KxTnm2wBF8jxL3LlR2Msbxpga4R
	NqkWud3PpEoDwz
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id
 5b1f17b1804b1-4bb55abdc18mr294084635e9.33.1794917638356; Tue, 17 Nov 2026
 04:13:58 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102042524.735613-1-tomo@flapping.org>
In-Reply-To: <20261102042524.735613-1-tomo@flapping.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Nov 2026 13:13:46 +0100
X-Gm-Features: Aa3M54oDmsH8F2UJzOAOloBBRoFk142zZMWaWQJ0l7j7DO5I1-cRODf4YaPktlg
Message-ID: <CAH5fLgg4K8i7DjXTaxD18uJwkOn+37BAVUozYEZbZvA74_o6VQ@mail.gmail.com>
Subject: Re: [PATCH v9] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
To: FUJITA Tomonori <tomo@flapping.org>
Cc: dakr@kernel.org, ojeda@kernel.org, tj@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, jiangshanlai@gmail.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:25=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> enqueue_delayed() takes the delay as a raw Jiffies, which is a c_ulong
> alias. The type does not show the unit, so callers pass a bare integer.
>
> Take the delay as Delta<Jiffy> instead. A caller that already has a
> value in jiffies passes it without conversion. A caller that has a
> Delta in nanoseconds converts it with Delta::to_jiffies_timeout(),
> which rounds up, so a short delay does not become zero.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index a872f9fffb90..e9bf30570aee 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -171,7 +171,7 @@
>  //! /// This method will enqueue the struct for execution on the system =
workqueue, where its value
>  //! /// will be printed 12 jiffies later.
>  //! fn print_later(val: Arc<MyStruct>) {
> -//!     let _ =3D workqueue::system_dfl().enqueue_delayed(val, 12);
> +//!     let _ =3D workqueue::system_dfl().enqueue_delayed(val, kernel::t=
ime::Delta::from_jiffies(12));

Would be nice to import Delta so this line is not so long.

Alice
