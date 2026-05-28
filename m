Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5113F23A2
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974628; cv=pass; b=Tjgcoe3LSDiBrhf5YiJ++wfJTkxekiXFvrAZc5TPMGtiMg2Bt2wQHUUSSbsySW4vAH6d2wucbsUSpRuCwJZG0UrJkIhkDx+OFE0kYBtPgmscgAwNGJvvKQM16nN835HIWcSeqtG1JL8JTb91oR2jnYBHmxE2+OBE7zpdbU3xvDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974628; c=relaxed/simple;
	bh=UkOFzSFECKhnU2YCO76iNNZZH6fL/SSbPNgksZclklg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQKb9L8Asw8c+moDkVFU7nHyBm0FMBIZoh0i4v6MBMwQGPiM6AUoz8NesntUxUSeTtwpl+5kpAqjEaonrEc3rzmeo8FAlhjqwOagaZ+pKMuAJqbeJiL/Z2TpIHaXvskM7hJomRAcR+3XR263SJ4ML7e9uQXYQgPvfvNCvOVKVPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgXMWsi4; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgXMWsi4"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3042a99f0ceso719215eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 06:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779974626; cv=none;
        d=google.com; s=arc-20240605;
        b=Ch838vhnJYm6Jru6ugn6Nl8ISUHL1KDc6m+UIFSiLJjxPYgQs8pAZtj+g6VUD9ipnf
         H3yq+hr2sN+wClSVOkGIsonMQl/eqtArvPutCSi0V5VE8YCCFCBqD3sd1C9xHzLZvv28
         XsYf251oyVGiRbZt4QsLUG+8Rkjh5UR/9AANQhAc/R2WHq+slxqp/Sf1rMyxby5aUio0
         /MyNfgdlJ0jxfojO/srm1PR+EqDSWvX2ZnEu/6TQCCuquPiXLChVM3fDU3Ab1eyD+1nw
         bzea6PaUy301nnU2PiTT1Qp/ns0QQMC4QhznmllSlbUR+0Zj2VmIG98Mz8sSw8cm+hya
         IKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        fh=Xa796xkE+HggxaRlY0lqFz9rSecxxyGOmQVjcGz2H88=;
        b=gDvh9V/gan5oxsfn6xuz9HMXTF16LXD746A1JH4VRi499YTJdI0R6pKhBFc52yjKSU
         QPszoxRxsUFckdFUSoas691Mp3xcHzNdT6hHw/ki9wIIBP4U5duKUK8/aTJBU7RurwP/
         /uufUbPp7ycsW1e/zn2Fgq2QZR1ODVFOQ/t0e5z1IWrKzGtp2cOmWJ+/4+IR3F4hh8dZ
         F6e6bFs4oSifKqIsbmucG6F5zJXi13rDNeApkQUWhVu0IVeA3Hyqa5bi+dBA10ALZ+60
         JHpZxPc0+ujEYXEpHmL13FYKhWbV0oVZ00TxYy+w0kIR8Fe6CpKQA6EHpfzmLc5mwlVC
         x1Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779974626; x=1780579426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        b=UgXMWsi4WRWJF+1drS5ntdbByedBTZevhNcXuzG88gucyV+autL5eI8/T+leLlNVBw
         yK5Ah1gKKH9V6M6i/f0PJvJM9wCpr2FcQX3ZyyYnTKAh+oMDWnBM2FpamoDUg6Jr1fXc
         EV/LJkG9SaYrykTpMNqiILpkR5KzdUAwZeIR3zO+r+srDQf/45VRKiS8of1s9wSiBRk0
         S2Q+dgXHXZ3+ftub2a/OuIdF8E9toizlO4Ox/t3TbifXylrLQNm/0RjEB2+Dugsrbj3p
         3ihfnFfW8QDpigGCWteJLHAQf9Py65I1OBuTMKoYa1omYz+XbA3a9w2sZBEipBlCCX2X
         B+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974626; x=1780579426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        b=ijb28o6tdN/Yp+/kq/cAWs2m7cUaP7Lv/jHdvlXwViYglDqu2bV2BO7QQX6/sj5U3U
         zsjE4ovKrp2BgEeaqkBjd33evNgOYH5wzRa8ytlU3yW1HCh2n/FXenmJoh85oCR1leAc
         HxTjn+mEdDnhO16dIjb2POvOk6c9dEF5I7wYcxjH7cFmlm2VbqMSptALtA6SW1YMrVaF
         tr5/ZXhI3DYpAD7WqTXVcF/6mzxupEc1QsEwucfGIwbrjx7Gx/QDweZurj3SnsiJ5KV3
         sl6V5oxlQsp70MHh2v8GKpvf6pEz/HDvc2XtVk1Up0qqsT0kwaGHMdeWb/6KaV/J1Gxy
         Ifmg==
X-Forwarded-Encrypted: i=1; AFNElJ+WZU5ApUYsH54LDP7kF+YcCw+0bh/coVHgcmyV8ZqT5IYO2EWiPJw2vwlYjIfDdfZqAQJpFjbEV68qMo07Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhMZAX0RYpIxfhLNl57mjPDzIZDrEWzg6qUDgYoyttJviax4h
	9NWeW7VT9cu+q3fSl9ueZYc8KRgJ5r71ExWehpdkNAvpH5aXsi7wC9cUb7D5fXJbvl74dt8JMGS
	3z0GRmQKC+zKHw8zGE7S/RNnH+UOqVKK9Xpngeto=
X-Gm-Gg: Acq92OFSkIdJQTrA1CU4hmCAsC9ARkGn8kQ6/Y4GRk3YyaZb5WyzWOxcDDotTfPT7aN
	2z5iTNFfPWMvwB98f74B+DqnxmapX2kB/nlwYjlsIy+nn0JCR9zDDwyQDviVHtCmjTiSw9Mz2eW
	ZgQL+i6ucfj1A5Ncx8RsFKCCHBQ+AvEKerZNEgCmoLYIHdXK7Hr2MF2Gw8bRoyXNnT3+fSoaR4A
	IbLMErpIqngp2Mme7FQOdrExUx5Omu4IYd94ehul+Dz05Xtu6+kBdnl1X2KstAOJgOwJN8DMWb7
	9nZQ+b+0aBQ04hAuUs17soLAgHhHARG9UZpV2T2hiluVF0algUIJQ9Zc/fYFL8ZGGPp01F6FmZx
	HqVvpEE0gEaOW1pnmrM/pyMQtT3tCY7e8VbO7dj9vX5f+
X-Received: by 2002:a05:7300:d518:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-304d2eac541mr642269eec.3.1779974626152; Thu, 28 May 2026
 06:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahg4XDoVOR7LD63p@sirena.org.uk>
In-Reply-To: <ahg4XDoVOR7LD63p@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 15:23:33 +0200
X-Gm-Features: AVHnY4KBny_eYsGJBX5AlgtWDSoezCQvFruw3k_VvBdYnSDDmQZZTbj9slTJ29U
Message-ID: <CANiq72kJ=iFeTCo_D1WdXhyirhOE1Rayz_DP673H_ijSCNp+Fw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:43=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I didn't diagnose which commit started triggering this, it's a known
> kallsyms random error AIUI.  I'm running the build with:

Yeah, we did hit that some years ago too (in a way that not even an
extra pass would make it converge) and it also went away.

Which is the hash that you used? Is it `rustc` and LLVM and `bindgen`
from Debian Stable?

Thanks!

Cheers,
Miguel
