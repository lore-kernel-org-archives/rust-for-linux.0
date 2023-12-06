Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PmEKKJUI"
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C7412F
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 08:38:59 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7c461a8cb0dso1473293241.0
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Dec 2023 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701880739; x=1702485539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbcOYch65HQgwW4bXeNQNStE/Bld2otdL+K6EjO7ssY=;
        b=PmEKKJUIVcUp9Gxuf3aFfdxZyOViqVpHsUBLh/iW827KBOcUMfNFsu02LTOFjHOZWh
         GhSiWdukxLCDFabebhw+pYRkab2cJTcg98+oHdmaIRmGxvsOH5CFUXDCvbOqBhsG0zPv
         u2v6m3s4XX06toKFB1JeNiFtaN8IXDGTKVTOB3kPAqwOfw++t3kSECOWQdii6+VZwZEn
         tYuv2P+lhTmBUeuyuv6zdlYa0Fk0xIB9hzEc2UGwuI4y0mhm3TKDWLdHhGtd5DpC+Hss
         Jp+H8DdnblZ8IZdZ0Xkf9DUb7AdebwV5QLjNwNjclHa4BwLGIPsnl6DJAtEBl4HHGnqH
         R0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701880739; x=1702485539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbcOYch65HQgwW4bXeNQNStE/Bld2otdL+K6EjO7ssY=;
        b=TJeqjc2W5h9F+ytXi/pOsNGVcp0CmEt0qKX7ultKj7fV9wB6LqExfd93Q3uF184pqK
         5IfuitqtksrLs/Hb6LSm5wTT+jQRnQGZr5iRRlMbUvqs7oy7oEA8ofbhntPiuB1BwCL9
         kVPMNluwcHIUXMxb0B6A/enU6GDjOf/uKesOFokxFOGYBL640kFpF2gtaZH/DBKDvilz
         ZDWJPlkeVNHsbYxWVrXA9wqCqZBmV0LKB5A751cUNQ5sHDT6uk8bjGtC1gDf1Yco+YEV
         BGcdNWc6zAts+jBibnRRhnJcDRCy/2TLBCvNPzFE1Dkz8m1BxtHJ6sBDsmkXTo8vFQ0r
         IzeQ==
X-Gm-Message-State: AOJu0YzoaScYu9qA1spf9BCeJw0RtTrNXzQ92H2Mt+ZoAhSbBIwDNiyx
	CHcIR+wyK8rsTe3TWKdw79WYzDvZC9pVQodzkTC78g==
X-Google-Smtp-Source: AGHT+IERg2HJ276lhfxN7rCRC03VoISQfXlpwt3/L6+Zjw+3y0AvD8tv/uQ/BP1oHi3y+u0vTOleQejpyX++CRsJv2s=
X-Received: by 2002:a1f:c604:0:b0:4b2:b4a1:593f with SMTP id
 w4-20020a1fc604000000b004b2b4a1593fmr599469vkf.12.1701880738877; Wed, 06 Dec
 2023 08:38:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com> <096b7406-b57c-4daa-9a12-38338dbd91ef@gmail.com>
In-Reply-To: <096b7406-b57c-4daa-9a12-38338dbd91ef@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 6 Dec 2023 17:38:45 +0100
Message-ID: <CAH5fLgix=tV6=VvACx6mhSTe9_HiVjxdgGdt+5iTUJuGH6t_LA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 4:53=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> On 12/6/23 07:09, Alice Ryhl wrote:
> > Sleep on a condition variable with a timeout.
> >
> > This is used by Rust Binder for process freezing. There, we want to
> > sleep until the freeze operation completes, but we want to be able to
> > abort the process freezing if it doesn't complete within some timeout.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > [...]
> >
> > +    /// Atomically releases the given lock (whose ownership is proven =
by the guard) and puts the
> > +    /// thread to sleep. It wakes up when notified by [`CondVar::notif=
y_one`] or
> > +    /// [`CondVar::notify_all`], or when the thread receives a signal.
> > +    ///
> > +    /// Returns whether there is a signal pending.
>
> Remaining jiffies or zero on timeout?

Seems like I just copied this typo from the other `_internal` method.
I'll fix it on both.

Alice
