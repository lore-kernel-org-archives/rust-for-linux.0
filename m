Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A391D88AC
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 01:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767835342; cv=none; b=uTbltVokXRXRM3PPr2QVd0fNkYdzjtNTeGTlKum5aRUebkOkGxeZw9bpbja7O1zZe62C2gY2EeQ98kh7IADJnEcySJkhoo5rk721QzQGpd9yHeoeUkmTCz6TOMbLj/Njyy7ZPN0YggQvOVDyL93u/JDQ9W2QxVJsyZSf/lf23Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767835342; c=relaxed/simple;
	bh=sFbBuRguTeRh3qlDBGfOFT8VWHoGyXLge18MokiSpQE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X8LlE9pGbn0IWnIeCT4ddFMHS/AUt2MAUAVBM04XlUqHMC80THk09hfHvrMWxfhyNnEiSij9txVfZ3RutzOi2ZOv64oEuM8hT90NeTUHgR8NutjlGMqF/ArGswrFCKkpjH8ecSP+0H5k+xeoZA4SccyKo5+H4e6JqmMrrr/ai4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDoNn6S3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDoNn6S3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c227206e6dcso1812948a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 17:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767835341; x=1768440141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P2mCYmVDIn49ItX5arh42Q+PT7tFbLbjhV4GtXIZbE=;
        b=RDoNn6S3iweB8RH0xi5NqVvl9DKsp5CUI8qkzuwx+M3Kt2tYwHNnmKldfMpJT18dcB
         HLlFk8IvLNqnzP9sMHW0sX7GqUFRBQOBp0+AJJIW67hUcBpUjlOl+8SgmrXN9EqPXuFY
         kx3kQ6lbcSzgpfO87bQBt4ziEIoL80upzRDnuO25hKcKFR/0CmpxKGuxSWk8RRoGBdqh
         6RSnSjZ3GR8dJuRON5eWBfpAKy1Izmj4AzAg4qoc6fewkmA571jINrK+7czhVcLlQZ8h
         qx16IpVjEc2t6//jy7YdCm0ITg8BS9QVHVihcOvbGAuVTs141ctj0G+j8HPIgYqI56DF
         7n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767835341; x=1768440141;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P2mCYmVDIn49ItX5arh42Q+PT7tFbLbjhV4GtXIZbE=;
        b=n8xrgSEtbso/y+XZFAIZ97qofai6LmyPvimXJ3upzHvaHBHLsIP/X01HeXk0s/eX2I
         3HoYoz9FQpfieCOwfGjOKBR+QiJpEu4KIaOm6mCqoPpkiBKwjh6iJomDAPgymRhkg4Iq
         e6lQ05DgcYM/IHiSGgI2X9LbEu2fwktvt4Pds96J4UVsAMudZK8t/shotTEfUCR6U9Tu
         oWc29Gq9hlhkKBnytxTgdoA/L/JppdOgFwkhyX76s/R+x9w55B5F1Sza44+6+yBuzrJB
         HdZL6pUsdm7x5ZjB1cSU09Cv+BA/geOnAhar4xiDbqUb521rV9q5ZLRDMSpt4WiryMH4
         fRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVmPThgj6kFVNXMtq6YRxDYgAwnaJoFl92cCL6y++Gs/OR5dVpG+3hRz5ThKBrUXJC4bJWNnxqQ05vX2CsPWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0O7fHiEpVfZTmdUmTRazhv6ck7hWGqKBYwdAgMFK2H+eS1OI9
	CXQOiCfWhLC9XhhAcpdmVRxXy0nujKzezEZ04t4TMg4qPmJyn5Q+m4ZZ
X-Gm-Gg: AY/fxX5C8ep8uePMXtpTgNO6srsaP18PnBkU2grvDJHi8MyXkXH3YYS0AD3eYY5eOS3
	ZVCfukA3ClUohCIiRpW816tVyGyiim6NfENNutDgF8gI05Lg/f1QauiFHlao/YW/XKNdNqrq6gK
	Q72dRZ2QFCYP2ANnbJIrZDEWqdm9RIhy6kJajfYQA44mBwJUWjMhKLqir4WFo28WDyiV5WwFy6r
	BOn0MF65pZ7qnhrLNf+WxvX9Ic/1A38GJa7mfghXxrAPkDqMQZy6aNbnHmcU7pYmXu9h9FMcC6/
	ww7EL5vw2TFRvQFQa/nHD3Aa1Awl/LynWxkFSOqP6yvZt6ZKkmd54IKeIfV/JhBROP2cC19YjRo
	NY/gGgI8vTMQG0ESWDmqQTJZf6q28+zhMnd1oCwVHfC1Eft9Xa6su2ZUuzfAZZxl0c3R/Siw4gv
	gIorW3LrDa8Mmiz9RMLmC1FeiZIXXve9Loe69KZH27wJ77O/v2kxyRPHiDC7JM/r0X1ZQRW+ase
	L0ynQ==
X-Google-Smtp-Source: AGHT+IEo0jCrfFf22bDeLL2Qy2cQq8OwVAFryvOiNgW50k827smzZRBnlizhOwPbkv17SpDjKQoXRw==
X-Received: by 2002:a05:6a21:6da4:b0:375:4426:e78b with SMTP id adf61e73a8af0-3898f9f0e9dmr4046437637.71.1767835340780;
        Wed, 07 Jan 2026 17:22:20 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47221sm60600665ad.23.2026.01.07.17.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:22:20 -0800 (PST)
Date: Thu, 08 Jan 2026 10:22:16 +0900 (JST)
Message-Id: <20260108.102216.1671347375459653445.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260107165344.4e928ab4.gary@garyguo.net>
References: <20251204223405.454920-1-fujita.tomonori@gmail.com>
	<20260107165344.4e928ab4.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 7 Jan 2026 16:53:44 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Fri,  5 Dec 2025 07:34:05 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
>> introduced by the commit aec58b48517c ("bugs/core: Extend
>> __WARN_FLAGS() with the 'cond_str' parameter").
>> 
>> When the option is enabled, WARN splats now show the evaluated
>> warn_on() condition alongside the file path, e.g.:
>> 
>> ------------[ cut here ]------------
>> WARNING: [val == 1] /linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
>> Modules linked in: rust_minimal(+)
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/bug.rs | 27 ++++++++++++++++-----------
>>  1 file changed, 16 insertions(+), 11 deletions(-)
>> 
>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>> index 36aef43e5ebe..a60db1ef4b48 100644
>> --- a/rust/kernel/bug.rs
>> +++ b/rust/kernel/bug.rs
>> @@ -11,15 +11,14 @@
>>  #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>>  #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>>  macro_rules! warn_flags {
>> -    ($flags:expr) => {
>> +    ($file:expr, $flags:expr) => {
>>          const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> -        const _FILE: &[u8] = file!().as_bytes();
> 
> I think it'll be good to still keep
> 
> 	const _FILE: &[u8] = $file.as_bytes();
> 
> 
> and have the caller just pass in `file!()` or `concat!(...)`. At least the
> concat macro doesn't have to expanded multiple times in below.

Good point; I'll update v2 accordingly.

Thanks for the review!
