Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B0420F8
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Jul 2023 14:01:18 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177341998;
	Sat, 29 Jul 2023 07:01:16 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-58411e24eefso32710247b3.1;
        Sat, 29 Jul 2023 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690639275; x=1691244075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xuh5Cs4UBqNeUNMN/mQsgq83P+5ZISF3WH2e6OwpnM=;
        b=a34dpUbr0J+lB/6X/9dOdt8MIolcJxJtduwWqrPhvTUwrs0Oq/zRrmUWRmmDtQZLe0
         TM8yy9ifgT5MD1+ZpTrgN54Ely0YOdnxPKx8uO6cTXD5YcDnm6LRFxHFFhfkXU3AynOr
         pcd/BITAtsC8UqViIR9zgoRIpZFqReCbuegTSbGYQLpJEfPO521QXrHz8NRUtToshF9Q
         4M6N/DbwqxkFzgwZJxF3GV74bWIn+tyOicxu6aHDWnAmL8xv9kGqoKftZrR0gQOaiZPs
         fI1cVfhx1UXDdAsG9xUejDLLFejyz1FK6om+88Vzw37QbboNYlwGr044OVa8Q7DmjfEf
         7WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639275; x=1691244075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xuh5Cs4UBqNeUNMN/mQsgq83P+5ZISF3WH2e6OwpnM=;
        b=VzQWxP1iTbN6QuS+L7lzyFPaYSAjD+r0VqnGM/1EcpEvgOoxGc2CncFX6uNJqag6DO
         N+tVgSA9uB5mOcHw36LmtoU8aKSh1OZ6wxyukv+a/o8qZthIx7f4ki4fSMev4uIUNIa6
         86c7aZDvEs2hfTVQoIc9fFQo+G722aCTKvUoF59xYvI9bSBj+0rzoChiK9wVUldrHso/
         fW5mwS9pud9/V4pTvP8iNJ69Ip2zNnhsUU7CVAWO2g/HHS8hWUBv155076uQNG9X0sb0
         IMbV3GmuZc+8O32xSFIEL/xZprY6OIA4JVGREo4/h9Ja50Fq5OuUofGDr4Xvpq4qd2qV
         7NAA==
X-Gm-Message-State: ABy/qLa95SMUB5n5kh1SmP+6LVU3VtIBDDF8eEbFbadfm02oFd2DYI6/
	mU5kfCRAxykflv8dNrMpd6RLaeSYtpM9XM1LetU=
X-Google-Smtp-Source: APBJJlH2f7tTSk2LKKiyU6HMdSYF5+PJWAFjy4HpY/d3u6cNzJrPmo83donOPCTz6iRTWqsUpKARd1HO7nnRDRO7xBo=
X-Received: by 2002:a0d:db44:0:b0:561:c5d4:ee31 with SMTP id
 d65-20020a0ddb44000000b00561c5d4ee31mr5593709ywe.38.1690639274765; Sat, 29
 Jul 2023 07:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230613164258.3831917-1-boqun.feng@gmail.com>
In-Reply-To: <20230613164258.3831917-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Jul 2023 16:01:03 +0200
Message-ID: <CANiq72=pb18B6NOcXF03d0ctOP8kv2dqnUeNyEuSvuDb=vs-0g@mail.gmail.com>
Subject: Re: [PATCH] rust: allocator: Prevents mis-aligned allocation
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, 
	Geoffrey Thomas <geofft@ldpreload.com>, Fox Chen <foxhlchen@gmail.com>, 
	John Baublitz <john.m.baublitz@gmail.com>, Christoph Lameter <cl@linux.com>, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Andreas Hindborg <nmi@metaspace.dk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jun 13, 2023 at 6:44=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Cc: stable@vger.kernel.org # v6.1+

Applied to `rust-next`, thanks!

However, should this go to stable? The actual functions being called
are the `__rust_*` ones (until they get removed in 1.71), no? Thus
this is not actually fixing the actual functions being called, right?

If that is correct, then the fix should change the functions below,
perhaps adding `krealloc_with_flags()` from the other patch (it does
not need to be a method, by the way), and calling it with a `Layout`
like the generated ones do. Then I can rebase `rust-next` on top of
the fix that adds the `krealloc_with_flags()`.

Cheers,
Miguel
