Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3990D2F9984
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792535; cv=none; b=X8VWzdc0g4QM14AspgcGaVw93h5ttoVtmTXwg+apr6NuGvOS9XveN4DejWb6TmxsNX2TL39p4eCuvgv6MDqCycVtEELGZlpBWWzkCw2fJGq4H+2gxfK53P5m2N7NdzeC45FSbM39XZsRwntJE70jvNcx9fKDhX+09DBSQ4Dj934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792535; c=relaxed/simple;
	bh=0CPNtG9KaV/mxXgWOlyTcx7Q+sWj/Qaq3yAUy0GQXkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rApqZokv6+j1gPkaLoEdFOaB4L0mB7aA3Hc0lRJlRc7H/68GO9A6Ios02ZN7N89xOWTB47VfTN3huQhxL18rWgJ5SxIFlc9d50dnITP2sEfRsFj+bJcWbLFDXoyr9UzdMR3LJEJRlxwyvHBbf5VqDEGmIBmlUBAWJZUXjt1cRwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVPmRDWD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVPmRDWD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so1674675a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792532; x=1777397332; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNWTKUwnrU4f/1KWLuTJhziy5RXD7g4YKGqyBo+QdTo=;
        b=FVPmRDWDWZyA6sMsQ2qPDsYwUHazDzqZ+/sEXBE9xekgN2jSr7aX9h9UwXQcPqlZGE
         VWTtaZ4kl2FWafVOYBnlPu31PtVELeyuECvAP1giPRwkxgWaZQg3G2aH9sQffyuKDOXo
         iPDn+FYs8J3BS6IPDujXWU3cv12yDt+Lo9W2AlVG5SQbgIIAPTqs7ZnmuOm7ZS4Gk9ce
         R5NbzzotX6zdv9xqdT9A9fVujr+mtiq9hcvHAeGQkhAwXtyEMiQrz6twWMSAm7Z8EX/i
         WlQuF8D3QRBULeIr+0f9uafwli3E4BNdrAikNOYLV877jnbbk041G8+M5UHv9HqUW9Ct
         iR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792532; x=1777397332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNWTKUwnrU4f/1KWLuTJhziy5RXD7g4YKGqyBo+QdTo=;
        b=X1qcJjhdEN199kS3pAriINsqGa6zvlfSLnH+pmOUEywuAutzI0x2pKqPVbE46N0EUh
         VmphILfkIFWzQ1xP0gSxrY0a1LN8d6teOdfnXx42TFixp+gunCOY0Y/xnGM9B40Nfsy+
         JwNjjfhJnn+E0t9lwnF/Oja5iD3uKgwXIrL+taaEtQ3jHTYmQpAFlLFfjoLqPYYtXy+o
         we8Pk50xR1FjBpPiV+Foo8ugsXEXQFLGqmr9X86t848TVngns86MVd+m7K/iZBjMGdt7
         jNHCU2UodyQpARpFKBtxbxMI/3y0lyHtAhIHmeDvc888ohHIs5vRHDpUvJurPrzv6Axx
         ppwQ==
X-Forwarded-Encrypted: i=1; AFNElJ898FxXyIWChac9LjVcEE4fqwnqZHDvmNyVT/7V/jvxosg05jNGm6Whv0FNG3CBevxkCGhuMiGTWwMkVE/2+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWp+YaZyfdPEJvW9Ae15vGeUgaPwOcWFda6ElosB6dSkODCQe
	RLiA9AqD8SiCKrblie6ePoCs15OUi4Bjw2uLl3Ogyl9B8Kl+UG2oT8zW8Seq4Q==
X-Gm-Gg: AeBDietXn6wKVEJo5HS04S26ujKkk8MjoTyfxJHdlVTmcN5mQ5xwm5numviAWBJkSlw
	YRHMnhveHwUVA92gzCah0lzbJiYFqhGEwi+aBxQexXPeEG+eQOP2rPGhThVVW9Ppuot1DIh2l5m
	KjPr51tv2kAa2uJvIk0TMIyazYGhM3btQJpxfNhg9eNzmgVCR1TcGrOpeHTGw/qHrNXz3ezjmos
	qTy/qwGfBWpzY3XEv/vrjUiIUPST/SAwOtJPpC63my8urHANO+C88SUdOcXi7qsQssRBL4uhcJn
	EkTZX1R3hmdUffcvW9MPa+7c6NQEabfOQe0pySP47hcwNTcZjjg/BKz5aS0CNHjanqv7TigdUNs
	Y7Je7msY5ML2u9y2lc0SSB3Mi+8SttWbLuUowSkTnHG4zidab1rcwYY5+hk5gtujjAkgHEiCzzL
	lmxvBafw3JzfuZoGMvjjye2QK6SjYEUWRKT7zOlCFpVqb/SU/J2Z8v8QcNdAMzHRBp2NkCFhcot
	/lgSSOLUQ==
X-Received: by 2002:a05:6a20:734c:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a08d8a21bdmr21718680637.35.1776792532369;
        Tue, 21 Apr 2026 10:28:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm10961055a12.28.2026.04.21.10.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:28:51 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:58:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeezhtH9PCaqfg7r@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>

On Tue, Apr 21, 2026 at 06:00:50PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 21, 2026 at 5:54 PM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > The stable support is available on nightly.
> > Refer https://github.com/rust-lang/rust/pull/147996
> 
> That PR was merged for 1.95.0, so it is already available in the
> latest release, no? Or do you mean something else?
> 
> Thanks!
> 
> Cheers,
> Miguel

Hey Miguel,

Yeah that's what i mean. It's available in 1.95.

Regards,
Mukesh
