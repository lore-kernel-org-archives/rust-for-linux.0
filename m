Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5614B824A3
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730931593; cv=none; b=f5Kaq1zLwpnpq8wD89x9zrYPhmtpAI7oLOYwY7rLDGkufeQR8WsvaeSqyRLJFn0mKDrJMSzVew/2Ne+2hhESM3V8uhhymGO55dfOf6Fwzv8SypfXVE46Rfg62/zpSgnknooAbEklxwZBiqM9wP4/8lqg20Tgopj2Pe4iwrktLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730931593; c=relaxed/simple;
	bh=oBnBqWpM8lRdtEoqkpENq0fMTF0z3JfZf00+3RNW9zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWHeeYr2HtpJOAPtdd4hItiLRIv7AZ3WEGXUv6X60aoZOKCIUu41/a93Js1Xr13H4X3Kbhx12s5D8RjNyu5rtxHDsaKMv27+8lf/1/zCDgc7DOKX0jQMI2fr/32fHnillhL508OQHxgQuZp2rXLaxGqZ8HXy1nyhgxJhjotEDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvjM3cOT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvjM3cOT"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so7462a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 14:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730931591; x=1731536391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=RvjM3cOTcqB/hxPw4bBvMJEFKEJsFueDkFcki+11WjTgflchF3SVXTd+1Ay0uD2CUK
         KwPGBCImdQtQU/UYiPcEzzHHd95JAeNnXeyJOqokGNR8IPJEnB8qwaHGvXF/ePSceMdm
         WmDm6c8WDspITHEtx709i2VHyfzomGBHmhVz5x75dy0iJK0gb042cUOdhWwxdmheK7+E
         00v5aQzV9FObAVyhGgPTqB/Usfg5opluGpSchzfG1o6JgELDa56AToVMZXoZp61guguo
         M4ve8BOVjtaVk9PZg1Zz7Ll5FpBkFQqJ9hwX1Eka6K73yvHfEQeI8BesACY2ERg4RYFE
         h37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931591; x=1731536391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=ulOkvGhfKGHrP7n4z24BsZI5S+ZaTPzDWEGAgwAyxDS8C8f7SJ4RZAjQcMAUvSCTU/
         wUJKx7Wbz/fDUtKRM4J33jXVAbHOtqvyI5Ig/aWJU06+kVceGN5Rofy3pAdt7y3NBx40
         DMX51PPE/pB80jZ56Cw/D9va59xDAwUW1H2UzGDrlSwOoMW5yAwxQ3FgV4ZDog2rFh7C
         noVZGMnOOmYLh22wI+ywbMLpfaFFJ54s4hrmEJ6/JDd8PpIyDvLe+kv1liqLhx1YpANo
         k0mOYVq63cOfoD3Y4+VRFmiuFDYReKBwLX93Rs72+7MPozNkj2Squ7bpcLoKmpdYNZVB
         DbMw==
X-Forwarded-Encrypted: i=1; AJvYcCUuVL3Qj/k2IhEzkjjkYTm6DbweuOnitiYJNpd77UiLjUBelOQZbfYxnQck8s3k1zCmhvLvZoyyRclNt+ZVeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Hm1BW2GUa7Z2a5koTpkiAJQ6izBTKsJbvjlgK+sWYKCrB7rX
	wru6mmhO6qYbUbbvOwvMw6QJuT/yc3V7IZVmbvfv+OA4wUk5D5clq5nQT2tOHlaat56xmpFZfzT
	0+2pRnFAAEuWG88s2Ro2h0bv4LWW+i8DPwWnZ
X-Gm-Gg: ASbGncuCEdaobJEQBkEk8GsbpwBPMtGV68bxpxCoxSe9mmONSH8vZTiR2bBvvzH/v9X
	D/ymOx+bFTS2I6UJJO1ki8u4ZZa8ZoaXmQWzufqVeFv3lVjt/MJx3VgYeGcwF
X-Google-Smtp-Source: AGHT+IHr43cQPFdqXPCZMuhW0YfDPZKYdGnYJyq09Flo3eqNIAHnldTJTztppmJyfXcIKbSiu12OxTpcgO6RCsjM9mo=
X-Received: by 2002:a50:8d09:0:b0:5cb:6b7e:9634 with SMTP id
 4fb4d7f45d1cf-5cefbc29fcfmr233654a12.2.1730931590492; Wed, 06 Nov 2024
 14:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
In-Reply-To: <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 6 Nov 2024 14:19:38 -0800
Message-ID: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> > If booted against an old kernel, it will
> > behave as though there is no modversions information.
>
> Huh? This I don't get. If you have the new libkmod and boot
> an old kernel, that should just not break becauase well, long
> symbols were not ever supported properly anyway, so no regression.

Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
then load said module with a kernel *before* EXTENDED_MODVERSIONS
existed, it will see no modversion info on the module to check. This
will be true regardless of symbol length.

>
> I'm not quite sure I understood your last comment here though,
> can you clarify what you meant?
>
> Anyway, so now that this is all cleared up, the next question I have
> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> userspace requirements aren't large at all, what actual benefits does
> using this new extended mod versions have? Why wouldn't a distro end
> up preferring this for say a future release for all modules?

I think a distro will end up preferring using this for all modules,
but was intending to put both in for a transitional period until the
new format was more accepted.

>
>   Luis
