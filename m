Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106534411
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="R8xGukhi"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E950A3
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 20:04:03 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a4e29928c3so49844957b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696820642; x=1697425442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a553ugT14gjtyNjW9GJo1PsSp2t+o25j6K104CIqPk=;
        b=R8xGukhiMZktIpz3teLsPIKTYDkTUYQj9ED/wpW+aOON8FXB+l88h931MxYjQEI/rr
         uuU3x+DuU2unty9tFbFqhc7bFhefZmPQ+4FB7y9F70LMa7YBAc/OGpPQO9jUKJTCtfsv
         WMKDemxbBQht4NDOqDK4ZGTlV/mqVh8/6sAKDbcFhEGOFMGqbsaxB1/ChzGdhvcCSk4z
         tQTtIqlM6SBarJ4MwmCwyJybormHIc1ldTT2CBtkReD7vl8mwLgMNki2uG0s2AsNPjm9
         dynpQ85r57T1iD00I/R2IAjTrqKfVeNc5q+rZTI7s684BgJTSco2ZTvF24/XahcYGST+
         8pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696820642; x=1697425442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2a553ugT14gjtyNjW9GJo1PsSp2t+o25j6K104CIqPk=;
        b=uYlD+Zus8NzZn6GMHABMSKS0PaBhVnZob9lCbtRTb24x0xUikYw5Xhxew3VLsFCJ8X
         TSf+5povXrRZ121sgZjlVFfbBL6ikSbtSvthM/gWipbm6veFwXYJ99pqOwrRlbT+XO2O
         JaUxUmLE0EL6rWJaoJyOSoq0SSCbpIIfOq6hAIbDw6YlfflAYrKmUEC8PF2tOCqYsRuo
         ui7qBUFcr1fGGhj9Z93DadEHyFcSipZXjj3N8R9pQ5jZtV/0EhwpF1RVNKSA1ybVMuyS
         3TixZAP26YHOzpnjJofUneDCgDKDdUaMSP94xs0GVNur+/IXE/OWm6YSXL/3iL/lwfZ1
         HtuQ==
X-Gm-Message-State: AOJu0YwPHodVOwgyl8BMwkSDbzl3RSML/QiElfMYjCzlgJttt3Z3CRVl
	nlqLcL2E3Xdadlcgt+2OLQUDlFVb1A2LITAnVBhzQg==
X-Google-Smtp-Source: AGHT+IGm38cgjsXeOz4waMlzo48yKVI+uickgE8vzurAuKu/TBgRk0fD1VLhqMfXvURX1bzd3NFVtl8FN3kY3OGaNHg=
X-Received: by 2002:a05:690c:460e:b0:5a5:eb:f51f with SMTP id
 gw14-20020a05690c460e00b005a500ebf51fmr11554915ywb.29.1696820642761; Sun, 08
 Oct 2023 20:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231008094816.320424-1-tmgross@umich.edu> <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
In-Reply-To: <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 23:03:50 -0400
Message-ID: <CALNs47vj=whnF1FcmmXHz=msB2j=GAnrnwx-OKHciW6iR+GUMw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 8:27=E2=80=AFAM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Next time I think you should put this in `Fixes:`.
>
> > [...]
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
>

Good point, thanks! I'll add that if there is a v2 (or Miguel can
probably add it if not)
