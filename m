Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753711D5CFB
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065125; cv=none; b=K5t8fCB1ATu9AKOfRIzMnvgskyyoc33KeVKPVaogtU1cO8a/g2uS1zNLlMICMnlfCvEzQo/yqasBYkAUYspa3m08Hqd1+wTb11z61RTAK3tV03tfPKvPZBQEMiLFbGuqf3IyWeYCVTiWRt+0/4BFrV+7II+SFP+t+j/IyNCw69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065125; c=relaxed/simple;
	bh=b47NjgCOmrDA1ny3RT/sxN6i21ieTBe2znfwf8X3+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7W06F/T0RZGCM6W+JPWvMzL4w4zZhNyYMEleIcjabn3btNThnUrOFtvxNctTA1sqg5f/m+rgeKDk2PpALTMPtV42/aVNlLO6tJSftlsQqBJ3deINd2k+80n6dGreMWmEceo8pTKU4mrhHx5sTKoi3WBxLGoZe4P+uDO8JPWLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMOLMQSn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMOLMQSn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so1802816a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740065122; x=1740669922; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rzc2bRExbKxZ8DpMS7TyI/zDTW4gUm/2Sk3pZDw0IWc=;
        b=OMOLMQSn33zi4nqH18d0aVwjxY0jEdsuLd1yzljsUXZdOZk+6ISIX8fdQF90aKBpSc
         1nY70B4OgO0HfhT62Fftsszx+ApXTjOdWl08ateWsZbbhy8wu8Au/nISKLwYjIPm70eK
         rBh4GXrHjs24vgMfBoRxAME+0n/gVpDf1f0o/HrMI/nlP03ig4wwxG7vOeFrMCl27qhL
         meyszRoQQ5zpNmuKKOz5Tqh5d1Ot/bbFh1r2twhk2VPdB9C+GSucgaAR4824zkSMrbct
         KzGjR4lsUI7eehXXcpLNAfQ3vbhYAUJ1Z+lDm2B6eXXOWUC9z4jjAlULBk9eSdnZ6qCZ
         X+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065122; x=1740669922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzc2bRExbKxZ8DpMS7TyI/zDTW4gUm/2Sk3pZDw0IWc=;
        b=Bo0eDw17xvSgx7p/Q0rdURUyRj5VO43Dx6R9cbfK4Ewv4yhKZ+TXJL+UsJBdEZeToh
         96S5zECIWgha4syjDHV4SBN0s5bjyyhYD1S5XkjQAzc5uXPeWV4KRE8TmAArYZ+AZ8ms
         8ugLGp81NYxNQy+u391NMPhjFsPBEPlFfA4T+Slx/bDZH48Zez/r9Q55iEgX119wfpn5
         GMtefVnUYhdzYGJcrsKDJjEPuDUMcqWqbVsZx0h6Pzq1maVr3r9jZOAha/98F6Ul94+W
         LJKfuAg705poN/+BnbKKQ+T/nXLQDTom5Z90RbXugouH2xHu3OoaMvhFMtah1UmQhClF
         UryQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3sKwqYtzSLGrrbPUUgzCcY4dTWCuAwkVKt4Q3pL0Waag5Xe9qXKUSaofz5JgFVpKLhFNnCwqaBOdS2AqjtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRSJI7u09DmBUXLxDMnAiKXDevjViYoHrCuKCIPg5GeNK0T4z
	30JSCMlH/nVCdDbdIZ2dH4GnH1IfPsSZ0Kq09m4pwLZE6U4+kCJr+o5xrZoBsyk=
X-Gm-Gg: ASbGnctf9M3642ZiYQ8rbWP+hHVPODKk3dZC3U85Tg8SzZziXVeGT2Ut0tgFCdR9A3y
	8j/w7Nty9cfsmxeKo+B4PoK/zxnHyHkHWZSQ7eWsJMo5xHpRocgTBqmf8BB28g8uhg19S0AEKl2
	dVF2CwDNOdwQDDcJ9xE8E9gYkSLKyMpa49P7iyt/JcnyH5kPB57WiH2U1KqRpOYv9EOyYqzQJhs
	dBEcOsEPjvGY9/aoYaHVHH+Rzze80JbtvJVcaJN6KjmODaBWb8YzEddWzeLuqruOMEF+qh+P0Tp
	315E8BW03j36/lov0331
X-Google-Smtp-Source: AGHT+IF4V7PCysU68JDjvDTqW9RwYggW3E/vYq+QTLI8ffd9Mxu1oKY8PfB2r6dneFImEjALVE4tbg==
X-Received: by 2002:a05:6402:3583:b0:5de:e13c:39bb with SMTP id 4fb4d7f45d1cf-5e03601ee87mr19818602a12.4.1740065121715;
        Thu, 20 Feb 2025 07:25:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e07f390626sm4091147a12.30.2025.02.20.07.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:25:21 -0800 (PST)
Date: Thu, 20 Feb 2025 18:25:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev, Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: Rust kernel policy
Message-ID: <84950d6c-55cc-42ca-9cd7-884e6723b235@stanley.mountain>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <962fa158-5315-4d93-afb1-8a1c08787ad8@stanley.mountain>
 <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f31a16d3898e0e9b5d94f9bcc12a1b73ac97982.camel@tugraz.at>

On Thu, Feb 20, 2025 at 03:09:21PM +0100, Martin Uecker wrote:
> Am Donnerstag, dem 20.02.2025 um 16:46 +0300 schrieb Dan Carpenter:
> > On Thu, Feb 20, 2025 at 09:57:29AM +0100, Martin Uecker wrote:
> > > In particulary, I have a relatively concrete plan to have a memory safe
> > > mode for C that can be toggled for some region of code and would make
> > > sure there is no UB or memory safety issues left (I am experimenting with
> > > this in the GCC FE).  So the idea is that one could start to activate this
> > > for certain critical regions of code to make sure there is no signed
> > > integer overflow or OOB access in it.
> > 
> > I don't think diferentiating between signed and unsigned integer
> > overflows is useful.  In the kernel, most security issues from integer
> > overflows are from unsigned integer overflows.  Kees says that we
> > should warn about "Unexpected" behavior instead of "Undefined".  In fact,
> > Justin Stitt has done the opposite of what you're doing and only checks
> > for unsigned overflows.  He created a sanitizer that warns about integer
> > overflows involving size_t type (which is unsigned), because sizes are
> > so important.  (Checking only size_t avoids probably the largest source
> > of harmless integer overflows which is dealing with time).
> 
> I agree with you.  We were also discussing an attribute that
> can be attached to certain unsigned types to indicate that
> wrapping is an error. 
> 
> My more limited aim (because my personal time is very limited)
> is to define a memory safe subset and in such a subset you can
> not have UB.  Hence, I am more focussed on signed overflow at
> the moment, but I agree that safety in general must go beyond 
> this.
> 
> But this is why I want the kernel community to be more involved,
> to get more resources and more experience into these discussions.
> 

In the kernel we use the -fwrapv so signed overflow is defined.
I used to have a static checker warning for signed integer
overflow.  There weren't many warnings but everything I looked at
ended up being safe because of -fwrapv so I disabled it.

(This was some time ago so my memory is vague).

> > 
> > The sanitizer has a list of exceptions like if (a < a + b) where the
> > integer overflow is idiomatic.  But the concern was that there might be
> > other deliberate integer overflows which aren't in the exception list so
> > Justin also created a macro to turn off the santizer.
> > 
> > 	x = wrapping_ok(a + b);
> 
> Indeed. This is the main issue with unsigned wraparound. Exactly
> because it was always defined, simply screening for wraparound
> yields many false positives. 
> 
> (BTW: Rust is also not perfectly immune to such errors:
> https://rustsec.org/advisories/RUSTSEC-2023-0080.html)
> 
> 
> > 
> > What I would like is a similar macro so we could write code like:
> > 
> > 	x = saturate_math(a + b + c + d * d_size);
> > 
> > If anything overflowed the result would be ULONG_MAX.  In the kernel,
> > we have the size_add() and size_mul() macros which do saturation math
> > instead of wrapping math but we'd have to say:
> > 
> > 	x = size_add(a, size_add(b, size_add(c, size_add(size_mul(d, d_size)))));
> > 
> > Which is super ugly.  Maybe we could create something like this macro?
> > 
> > #define saturate_math(x) ({             \
> >         unsigned long res;              \
> >         __trap_overflow(label_name));   \
> >         res = (x);                      \
> >         if (0) {                        \
> > lable_name:                             \
> >                 res = ULONG_MAX;        \
> >         }                               \
> >         res;                            \
> > })
> > 
> 
> We added checked arhithmetic to C23, we could add saturating
> math to C2Y if this is needed.  (although I admit I do not fully
> understand the use case of saturating math, a saturated value
> still seems to be an error? Statistics, where it does not matter?)
> 

Normally, you pass the resulting size to kmalloc() and kmalloc()
can't allocate ULONG_MAX bytes so the allocation fails harmlessly.
Where with an integer overflow, you do:

	buf = kmalloc(nr * size, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;

	for (i = 0; i < nr; i++) {
		buf[i] = x;  <-- memory corruption

The buf is smaller than intended and it results in memory
corruption.

> In general, if people have good ideas what compilers or the language
> standard can do to help, please talk to us. It is possible to
> improve compilers and/or the language itself.

Thanks so much!

regards,
dan carpenter
