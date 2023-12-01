Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eRDiVXl/"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D311A6
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 01:06:40 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50bc42e2bffso2235877e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 01:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701421599; x=1702026399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JTU9CaHiSbs+o3JtKXRUkQIh0ncmcY1dLiLoH2GmSc=;
        b=eRDiVXl/J1Agej0Ydb4tN2X57AnRHeJUzyHAhbzAm1VWss/THydLxgLa0hQdGZN8dw
         5pEH1Tys+h+JWpqEmUDzLS+jB9fR8AhUGSjO/2KrqKOH5R4Tw3h6QeGxa+hxFjYFdkgJ
         dcXgR4C7Cqy9PcvY5RVP7yDmEtcqAoQNOl4eL3Xc0/ym1QruDVjN3sAq2VtCwtZ6dh64
         sqkH4mM51y9XsWFRtNawvuDHB36V3dWG8ClVyHMvuszrjpEMU+nWQzoOaBXcwlE+bwiw
         QYG8i/depsz5/nDVozJaNkZLVsNB0wwkg1MVUttrLEoWWFpg8j4XHlT4QZgpURCzFQwK
         Kwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421599; x=1702026399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JTU9CaHiSbs+o3JtKXRUkQIh0ncmcY1dLiLoH2GmSc=;
        b=ZYRlgIhoQKIGERxACsukWHCjH2kLUxjTciKXUvWkHR99YggnJuPUeIG1gr8nWI51UJ
         EK7hI3W12G5Xo5pC0pCJ+ZbnLrDxd6/R67GyTwn2rynJYcscp6UwKhHcpjdvVr9PNIDl
         gUiVGjkjwAfO8aozFcD5nRIrxB/9xOmrxGuvtCSEssFpmgEe8eMrms8MzJ3wK7wNq3j/
         JnYcnkVIOWgBunW38huenJHlnWiGBlZR3YklSIF2dIjVEPczOa9n9ts9v1g/h0XLrq1j
         5c7IZ29vKeimZy9hhFhf9+9CoyD9n4M4fsoW6XWSVQFn6v4QzHBLsh5JD/6aH/A39raW
         WZfg==
X-Gm-Message-State: AOJu0YxzFixqlK6kzGJvgZTA30wLT5TJ34chRsoP+CrPM3RtoDJTtR5c
	j5CCn3+AjJ2brow3VCN0HgXTGBoJG6gZvMY=
X-Google-Smtp-Source: AGHT+IF1d71ZSf2Kl5mbx0A46QnrKWBkTAOhf3JIYbyOUWPIwbkOelkfoAfTB16bjtarCcRq9aTx9X9Pkee6Tmo=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:203:b0:50a:bbf5:6697 with SMTP
 id a3-20020a056512020300b0050abbf56697mr34127lfo.4.1701421598775; Fri, 01 Dec
 2023 01:06:38 -0800 (PST)
Date: Fri,  1 Dec 2023 09:06:35 +0000
In-Reply-To: <W6StBLpVsvvGchAT5ZEvH9JJyzu401dMqR3yN73NZPjPeZRoaKAuoYe40QWErmPwrnJVTH7BbLKtWXDOMYny5xjwd3CSLyz5IYYReB6-450=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <W6StBLpVsvvGchAT5ZEvH9JJyzu401dMqR3yN73NZPjPeZRoaKAuoYe40QWErmPwrnJVTH7BbLKtWXDOMYny5xjwd3CSLyz5IYYReB6-450=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201090636.2179663-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/7] rust: cred: add Rust abstraction for `struct cred`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me, brauner@kernel.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	cmllamas@google.com, dan.j.williams@intel.com, dxu@dxuuu.xyz, 
	gary@garyguo.net, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 11/29/23 13:51, Alice Ryhl wrote:
>> +    /// Returns the credentials of the task that originally opened the file.
>> +    pub fn cred(&self) -> &Credential {
>> +        // This `read_volatile` is intended to correspond to a READ_ONCE call.
>> +        //
>> +        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
>> +        //
>> +        // TODO: Replace with `read_once` when available on the Rust side.
>> +        let ptr = unsafe { core::ptr::addr_of!((*self.0.get()).f_cred).read_volatile() };
>> +
>> +        // SAFETY: The signature of this function ensures that the caller will only access the
>> +        // returned credential while the file is still valid, and the credential must stay valid
>> +        // while the file is valid.
> 
> About the last part of this safety comment, is this a guarantee from the
> C side? If yes, then I would phrase it that way:
> 
>     ... while the file is still valid, and the C side ensures that the
>     credentials stay valid while the file is valid.

Yes, that's my intention with this code.

But I guess this is a good question for Christian Brauner to confirm:

If I read the credential from the `f_cred` field, is it guaranteed that
the pointer remains valid for at least as long as the file?

Or should I do some dance along the lines of "lock file, increment
refcount on credential, unlock file"?

Alice
