Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6319D07A
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782516851; cv=none; b=h1UYAFFadw4TTGpKWSZV1X79AqIAFA2nZ9KLuYXmc7kqyG7LQjKIq3HLYYxTzANVBU1REA3c4tyP2s34Px7NCk8RbriwBAq6iq67mNsxTN2+o1Y9JoDzcA3lyps4gky26uqyvTMM5YHnXfoXifDYSfhs//ZKgda8uYo/huY2ANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782516851; c=relaxed/simple;
	bh=ga3W8COJGPsHCNj04d6CDGNT/SVktN1m7CXR54aYZXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSTC3j2tm1ZV1JzUstsHNbqcGrkwWBo7PsifQ8LKl39fMpKUW0jR4ghJx4EePhTSfUpIR68CvJFsyvNgg5AvHGQSBw/8M9uK+jxeJpQvJ0toKOdrLG7DXMuWRg60nHiS3VMBPOTBZHKThYBi8t3y97ZkBxtvKisAebqlNObDTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XINeukkb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XINeukkb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c81db32393so21305ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782516850; x=1783121650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/mlOm+EvYNj9PoeH03xIFO//BulUpthccmQCONY1WaI=;
        b=XINeukkbzO7RptIrulPwV563Qnm6kD3C2bJbHCds6UU5DEdy012jeGZzp8GcV+ucUd
         ATadUOILummMvS5qnTS5Ko/kzY64cVD/KmsRIUjbK/8GV7VXzlBq4noUPtFilJA9rAsm
         HFoL7wmf1xYicnXnKJ5LCjhPwmY621kDEhUMiVUptRPb4szYrH7oHuYtBXEg22iXqKGj
         fl2enfchEVJwkniJSLJCWdklAIvI+jvYJzlVvkX1WrXBza619+5dOwaNpC+TJ4+1qqxb
         VVN1Y5wVaR11HuUPSjc6M6vD7mgHDkYYrOpWMh2K6/2bd/HmDWFLfKQhS/pb6L/XvbKs
         koiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782516850; x=1783121650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mlOm+EvYNj9PoeH03xIFO//BulUpthccmQCONY1WaI=;
        b=VFq/nzKbJ6DX1j3paPux9OCYvYoXjAd85po7IzW5JBO2XzLd4/ObrbbGqXotkmR4pA
         8WD00X39umYnhT/5eDLSKpNcDFuwC+K9JRIV6eK+VzNDw0G+HWxmGx3K1U494DJKRJZ9
         e05fi09x+WLQJUzOoi+nLYbhvlU32EEy+qF1BdgE4hAgSR35pCRTUMF0OF7lfl+/LAod
         1OYC2KEaV7mDui/S8KFe5meD1rtJgvcSx190eiMTm8+KyaZgEpFXlK92BcwRaUb6h8c+
         WRATibX8RBskxuRwLPa5HT0QgtQYGvSv+XS2zHp/sg9mEEfl9dScjDH6M60Vl0N/pmfZ
         dasA==
X-Forwarded-Encrypted: i=1; AHgh+RrDrCpaEU1grlP+/mhTA3SFdNLGmvhP3clqXHdze0O5uVUKeFSfyAfyvRDjtPy1YxXRDohAjR53tBONFGKouw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWai1QD83PcHAMDn88o0vqpAC9b4/j2SnUJzk6RxE4z8EPutNX
	oRjsTyoPL3TgGCi+Dcb6Q0XGvmw7GsLd2JGu1eR1DKto41WGtKwRdtuygytSatWuuQ==
X-Gm-Gg: AfdE7clNR0fU0Gg8knvsuFiZnW0jrNQ37AM1pCQOa8EOC78UnA1TyTKArKP6gpz0YZ5
	QPbk30mxb+zBxk+2C8WmNNgU9efURNPd/sA7My4MGfXQSg7DEd0Wr8geFXMmy5lKjsYBQon3y22
	9O4pauzpS54RGHPiN5RiejTs4KZTwmhxeo36Vd+/6vrGsB7RWGcptobLGllhI1WcGYVgcXTnK4L
	BFB4V6dSGGPNYUJVJGufta2XVXu2aEn1YOZ0LD609UsTibmOZPo7SU/R+hi9rKLa4mUBGHd+eRm
	k/X/WiSGBS564LzURokN/YGFbdZgsX2ACAUM+ae70wlyTOW9kW5asNpRUDuo+uQ6KLxhYRg0vKf
	C+1qjh/E9RJkYd1WwxpPRm+1of1vG80HLE+FCT8TUgCPdPICw7GBt02lt2+BUn74w6Amp5fFMKK
	BAPPMMMl94b47FD+l8Wy9adusDsayxQqEMWxX2V+X7cN3y7EymSjdLZ8y46L7Rb7jhFAPGK1Sx1
	b+VIBR4Ld39Pk+suO8q+DJorA6NxJoBjVo=
X-Received: by 2002:a17:902:d547:b0:2c7:debf:2146 with SMTP id d9443c01a7336-2c9ae678e04mr514775ad.9.1782516849558;
        Fri, 26 Jun 2026 16:34:09 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c8746bb81asm13225225ad.30.2026.06.26.16.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 16:34:08 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:34:04 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/5] rust_binder: use pr_*_ratelimited! for printing
Message-ID: <aj8MbMMXSov7yzMt@google.com>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-5-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-5-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:08PM +0000, Alice Ryhl wrote:
> To avoid DoS from printing too much, make printing in Binder rate
> limited. While we're at it, fix the missing newlines at the end of
> several println statements.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
