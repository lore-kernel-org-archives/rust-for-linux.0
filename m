Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxA3i1Ch"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9233D10FF
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 02:48:35 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50bc961b435so1927111e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 02:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701427714; x=1702032514; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3BDjvfSfgdlHtcZ8hZz7EmYheIAAA3/9++NHU5PhyfI=;
        b=sxA3i1Chktm3tCfmpZuR6EOYjQm3xstwFoUilO54Kl/cjp7pWByFTIijDNMQuF4Y+5
         rGy778iYi8e5UnoZPTD6doM2FB9rEL07USlqL0S8iQ/gut0+soyY7ocQkbLxZow1YRDd
         dCCUxnX1FMF2mch+eKJblwTjtSp54fF/eiX+fycLdzDpHf7JlLUgK25lkAqtQmJdQCMq
         g0PA7ObPTdWlf6YeDAJ3Itys63Gi8Hy8lYRhPJUi/8ewQ+WLEkW36+0Na3jUe4AkJQ5w
         c921+6+Fs9vLHZGnBKBXCdAz631n0M7OaCkDhhzarZcMatqSbcLMgOXdlH6KCmtXRf43
         EVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701427714; x=1702032514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BDjvfSfgdlHtcZ8hZz7EmYheIAAA3/9++NHU5PhyfI=;
        b=xNTnyShoGPbzddJpQ1ayJaVqRRD2ALFY4YxawSgShMdHlC0vcjsQ86l/wR4r+C1Rsw
         joWBdAFc1fzmcq4pb7y7meG2HXA4ZR1iVQ9l+PqaWJNwjmvFqkBlwPx+Ajy6BIXFDbWo
         FP16okcNvub1HN5tmVEL8KPYuAwNP4Vxd8nY8ImeXUQvqKOdN8b607639a0pYmODDyzq
         BEKpv+6P0QRowZhj4w2fmJiaF3CrSTtSdwC89EeMEZ8FvBXrc8nPkuOQ/OSQZqy69H9w
         c4DlXeNF/oASq4uXaJbwc7RjMZdjFddssal9o3kQiek46IC9sa8fgurZvEvcon2PoKYU
         DHOA==
X-Gm-Message-State: AOJu0YyNBkp9rDiyLuNToxLtTUgWri25YW7TWjsDryf6VdFDJEOceFPz
	+SoADpfUjxmAEA7OFjhNR3osQg6iMhuXQ6A=
X-Google-Smtp-Source: AGHT+IEzi61X/M3D+na0c/GNtZpLFB3jhENpvRbleN1ckp3ofjr0vhqRpfSfnFgflMyTtYcH8dFy9dp2febKZio=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:15a6:b0:505:7ae3:182f with SMTP
 id bp38-20020a05651215a600b005057ae3182fmr37944lfb.12.1701427713791; Fri, 01
 Dec 2023 02:48:33 -0800 (PST)
Date: Fri,  1 Dec 2023 10:48:31 +0000
In-Reply-To: <qwxqEq_l1jj3cAKSEh7gBZCUyBGCDmThdz6JJIQiFVl94ASI4yyNB6956XLrsQXnE4ulo48QRMaKPjgt7JZoolisVEiGOUP7IyRdecdhXqw=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <qwxqEq_l1jj3cAKSEh7gBZCUyBGCDmThdz6JJIQiFVl94ASI4yyNB6956XLrsQXnE4ulo48QRMaKPjgt7JZoolisVEiGOUP7IyRdecdhXqw=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201104831.2195715-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/7] rust: security: add abstraction for secctx
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 11/29/23 14:11, Alice Ryhl wrote:
>> +    /// Returns the bytes for this security context.
>> +    pub fn as_bytes(&self) -> &[u8] {
>> +        let mut ptr = self.secdata;
>> +        if ptr.is_null() {
>> +            // Many C APIs will use null pointers for strings of length zero, but
> 
> I would just write that the secctx API uses null pointers to denote a
> string of length zero.

I don't actually know whether it can ever be null, I just wanted to stay
on the safe side.

>> +            // `slice::from_raw_parts` doesn't allow the pointer to be null even if the length is
>> +            // zero. Replace the pointer with a dangling but non-null pointer in this case.
>> +            debug_assert_eq!(self.seclen, 0);
> 
> I am feeling a bit uncomfortable with this, why can't we just return
> an empty slice in this case?

I can do that, but to be clear, what I'm doing here is also definitely
okay.

Alice
