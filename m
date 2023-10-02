Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40231CF83
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 16:24:47 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F4ABD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 09:24:45 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f7f46b326so136885407b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Oct 2023 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696263885; x=1696868685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctYR3P50KnM29nF33QETrQF1/5vLia1j5GumXdY0rBI=;
        b=ImYDdAAwvxwrcPllvWt3oAOxhPsCxc34xYAgTfIxsRsQ22NnwMyf7frUBW85c2bq1p
         J3RfI6TZ3dY6CTip7vgJ7ASU8eaLX4z/koVNJ+RPCD+ky3yraP9slDfyvztCHr53PxvD
         SOScejzufFkKDqt+L0srOiIKrQwbRi7pfzCy4Rw09cPYkWScZpZXYKjqUAVcNyqilWQB
         8t87cRYDdMDgEPwhh6zlDPUlzp7u09BymclagkX5WTpzCB9tYVbEYaXFbqWt1BAp+wLT
         fFEkYMiNml/SSPpFwgmHpc5G2ofJgNoj9nBX535ea3BjJnRWFyu5Yzwh2/ZehO7oYZMG
         z9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696263885; x=1696868685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctYR3P50KnM29nF33QETrQF1/5vLia1j5GumXdY0rBI=;
        b=peAmMflR2NXA9+AjeBCWQNS5ju9q1YC2msu44tOaNP0tymQTYJ1NyTK+W4hxZ0Cr33
         z8uxiyHh5A1PQjSo+VE4zqA3ZrIpH7jThoOXQScF+NDEmwoB0m/xN4aWvCbC5qom3KeN
         zWPaDT5YF+QyMra+OyHmQdSkBXB9qN2fmvRUt/nHg//LbhsTRcby8/32vnLyTsBZYkxs
         1g/8jBOHUSBQQWsOu3q3gIu33k4PQQLrlEqqB3vsulPYiZgE4akVLjPG4L7guuKJJCa6
         WQiN7uRTzbUGyfsml+tm12PKUlFOJy4sRpb953bTmumf68Ea49put1BO7DF5Cxc40/O5
         CGgg==
X-Gm-Message-State: AOJu0YxUOVc3Ho88BGznzMU9VXKav9z8Jvj7TlW0cGVEtHxFHtnDF1yX
	2WwWhwoqgOFOmhFeAQpFs+CXwdZ80b8jJamHpE4=
X-Google-Smtp-Source: AGHT+IGFUEMu/XajlvpDp7IGlBRePrY4YiQd6w4/IU5CRWPkwrBi+RO8cb5xeFvADDmUNMNaQX+AFYt221W1wn1VIUU=
X-Received: by 2002:a81:9197:0:b0:58d:7599:676a with SMTP id
 i145-20020a819197000000b0058d7599676amr12334550ywg.37.1696263885047; Mon, 02
 Oct 2023 09:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com> <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
In-Reply-To: <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Oct 2023 18:24:33 +0200
Message-ID: <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 2, 2023 at 4:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Can we expect to see a section maybe referenced in
> https://docs.kernel.org/next/networking/phy.html generate from the
> Rust code?

If I understand correctly, you are asking about having the Rust docs
linked within the C docs, rather than the other way around, right?

If so, what would be the use cases you have in mind? Knowing that
there is some Rust abstraction is using that particular type/function
would be one, but perhaps you are thinking of others?

I imagine a way to implement that would be a pass that saves a list of
all used (i.e. not all included / `bindgen`'d) APIs and types from the
Rust side (i.e. everything in `bindings::`) and then kerneldoc can use
that to do whatever it needs while rendering the C docs. Or simply
doing it at the header level searching for the C header links we have
in the docs.

Cheers,
Miguel
