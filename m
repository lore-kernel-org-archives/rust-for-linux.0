Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B4471265
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902633; cv=pass; b=KDeownB1nZam+v+Q829VkRHTcraTE2V70QlCtMDg7S/68h7lMEToZEHr45yPeKvrQsi3PjQStiJ446h081ETnESUUv45xlDxRmDswomPgEaFb7FpzE/+0cRliAbrb7P21xjH8PDRTc8MpOFxgOqh3Iu8nrMcjSfVUDkejsoBMFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902633; c=relaxed/simple;
	bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbqcO9rYaqGtPw5DS34/jCpkAmN6vz3rgppv7p7EjPj6mMbB9yJ0KXZsb6CCAYy2LPRtEFN9tXdYhghWhPROczPqjJv97QFcTFVPJ0ibwuIl0nhJto9NiEJdABEnEJVqxtdIA4IOONWV5O2PdXmQwEQgnyO+X8Ctec2sk6XsqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxU0ZlXX; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxU0ZlXX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed442so890539a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 14:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788902632; cv=none;
        d=google.com; s=arc-20260327;
        b=UDoAYyv3HLQNGtvSFQYZ1HVCE/QjsXonM6guqBIoFMCuKUacjw6/rtAtUdNa4yOy+f
         fkTLz+x3SxaEV5kDI+dumjdPdAL3TpLIi6LGRiGWAdfFgZV7DnlY26kZqTCM//0ALl3p
         Wk0dwMElUSfmjLvZ+vN5j7Ma57FeRPKrgbsGgSvQ6849nf+g35relJVtl50eR/psLHrk
         sLoAouShkTvvgexCMuj7vShfNgXs50Z4QVnAhPDDXH0Mq9Zhu7AJM6+39vtxTEh8hamO
         RT3mqVl4ypgoXd/qlWCheKkPTrhdn0qAZT+udQnn8mK5xFpvgUOCx/UWe8Pqmctu2XGC
         078A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        fh=0Q7DPzvxcWtCok7GTdeI33OEyHDHKZHh+6syHHSE4jc=;
        b=QZvPmPkmmdL96b0xWO45kzdCiHqguVMa687LWdNhWAVwv352aZiBM1gNtKi9BzC6Pi
         pyzAR4ACqA6K932tOCtNwowjzJcHqqg62Tf0mqRwtz/tgSwoYanO6CynpfmaGX/cQ93P
         91Zl2bXKeJAf6xnsr1Pc1vxzzsa5zEU9kF5x22zk8Cda4NtMVrPvC2H9qhtpwt1DdTde
         5GOVnBFhcKNCsmQz8bgqEngVZbxPgP/+avgkLmLFoB/02bxrJZzjHelg2MSq7DT7tnMA
         P3iekC7QMAlDdUTAo34qe301JYPKrXXCT+j2lPjH0nKsRJZvHIJ4hrRgegVNU88+TMXH
         BzIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902632; x=1789507432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        b=ZxU0ZlXXjWJx1SfpuPholGyclksOIOdBi4ZhTLJ4wF4vmaB+/hHUx19zZtpavvwn/u
         DYXz1KTFO0oA+kXlUADY96JCXquFxX8Ci50sIsz/2KwZplhbrZQSH8o5CbzGZ3VPEvhM
         BoLGlW+dnHO/xUTTjDHdnPIbQtU6svube/rpGC5ICB8PsnfXK/kuXe/x87uiVcBrcpi3
         WmKdZutD2rHr2GXmZsbYB6KY7p8nmT36ljycRxbqnEP4ERysbokTHNYF+dJ29e2dGZKp
         pP+w+tmU5d0+lV+beuvDbu2qTmhONpmFq1FB/0kEnyaywk7c7mIIFSiwi58T91hDvbF9
         Jrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902632; x=1789507432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        b=jCict5SF3a/XTRrQGzcip5Wbcy/MDW96IKBlAS1eGsoBJPCBzn+6TlvSIHasm0MnSL
         BItUJ3cd3dinbhUBnZFXlHEueri6WKmXBTd4umb5XSNUwRR5uXaKZosWIp33T9+KmJ0x
         I1mZxcm/81yzKNTctrIVdkaPk5RgJ4o5RN1yMv3vgEjv+oO5Bq62B/5PaQTxuq65fWv/
         Qu6qADgTuPVmIjRnsvHfpjXP4KNJSmRJI7IVdcfbkGcbTZscGVBH3mxlJm52hAUtDnPB
         1KYh4oiMWXcuqo3N565uUDKwBXNIaHFio3cai9h/5+AAXaauWQ1UcYasJ1qRO/28PxVs
         8d4w==
X-Forwarded-Encrypted: i=1; AKwUvBzFG3KaT7LvPZBD9GqwpqPAr/tHWwYV9AHBPhE62BRkhkDsJNJ25H4Ot3r9/F5uNcAkJAEy1VugO3n0ddFbvQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kT9ffoRkc3UuOTJF5qreG8DQC6AXQX9x/Dbyapl8MZ2AEVHUlh
	pWp7WD1GTFd4oVsK7Y3yiyE/IciV2NQJBxY8efO1SvBvowYPjAwH3WLIz3jCF1FCQJpkApJHNa3
	x2wDGs9GCCCGpK9LnxquI0YH7cYlPDtc=
X-Gm-Gg: AYBFou1pzaAe/jUgP6X8OuuD14616OBwwgsKlRKX/R6qWb6en9+Ohw+BVRdUwqpKzUJ
	C0U1gBq3gSCIk+qSZWTq3/5pI/rqKtD9vd0ncPzN6usL5kV82sOxUZwjuZe/NZ/xlFLhNwObL/E
	sIVe6J5aVANWsYEXVlQZ7OJmX2r8/PTCHZoFWENv6QKPNNaneOBbrLS6rmpC52ctDxMryqVGxRR
	kCFkCEDorMx4IfTa4fB4EO410CwjDDvIvW4xY6Ik8nuw0InBkBSK2r+R3GngalhyzSi5B/NJSCo
	mf7OzdgQ/G+UkiZErTocSmHhy/IEgoR7Vzseu4AfadbH3oC4LkMZANcqGJXZQZsG+1UMvhpLj94
	sBTp1Mui65QqK6l1LQQ7a8ml0f3U2+GB7QdXXIU842A91tblgZcmrnr7itUL4LMoa+5FZ2aKABy
	5GMokZNRmynfs4GIYLx8bdyJDxFlTH/khVgkO/tAP2
X-Received: by 2002:a17:90a:d64f:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-39b26741434mr30003398a91.2.1788902631620; Tue, 08 Sep 2026
 14:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908170539.345207-1-ojeda@kernel.org> <DLA8FDX8R5V0.7L5PQVACRZ75@garyguo.net>
In-Reply-To: <DLA8FDX8R5V0.7L5PQVACRZ75@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:23:38 +0200
X-Gm-Features: AcwNN1X4bcqwQ0MJOPRu5vcewCnbUR4xNtVMmUXXz_IpufoE2vKr7IUf6UlsnAk
Message-ID: <CANiq72kOPyQxPEpRCpTGA77uu9qqZhDB+Xmsw7zgk0egrTD-mA@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `unknown_lints` in generated bindings for
 Rust < 1.88
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:54=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think we can drop the cfg on the `allow(unnecessary_transmutes)`.

Yeah, you are right. Perhaps it could have been temporary with a quick
0.73.3, but Emilio replied already.

Cheers,
Miguel
