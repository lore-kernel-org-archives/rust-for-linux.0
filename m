Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A615AC4
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P08UJOZA"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CBCAB
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 05:28:25 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a21ea6baccso54322887b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696854504; x=1697459304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkfaKXMs1TeUmaFkYIgY2Vh2flF1VR9aeE/iw2H5+LA=;
        b=P08UJOZAiM460OyV8Ph65w5tT13ga2u4LMARhGTDLaFYscfh9zumNfsWzxVZ4Rbze6
         VcpuJtBpgVebq4SaH6cdg3ySIUBi9Jjv/pmO22a7GtQxJsZYn/DPqWOLuGgqOBcmH3B+
         guY4YFyG9TiB4QV6knvfD9mFqdBFyBYgc0YtqWno+wdI+vdQGBTNScVQfja7F8rFtN8a
         LVd5uCr3qlo11yCH9aP0E1H98c7g+oO0HX8iofKAFZ0IiRqRVHclmeMVnWHbSstmeouo
         H9JHE/3Krprev3iwXjTX8j40c16S+XrsFZWPqVwcHmY9mVotZmYcc4sIejg0JyPU7/M/
         rBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854504; x=1697459304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkfaKXMs1TeUmaFkYIgY2Vh2flF1VR9aeE/iw2H5+LA=;
        b=AtVyYe0ePx6EUnC8SEtmceph40MkV/dkxi2KbIS44jCN/eIBzXJhoIedO7s3SP3Ok5
         MWAe0lrLfCMgolZ6cLpJ4wZZFv/0YhTvfElu32p1Et6CfaUxqmwOMj6i+Rwmb1ln+0G7
         S3F4tcWJsUkDtuCO1dk1BjTx9HD/FxM60XqZjVbJo55DO30Ej10rKIYfrEsQ9GkTxnZZ
         bmP+RBRYX4uLfkbL+e5QEgkr91dPYBUv7g7nvgWb83A/xIRZWHZRL9YXvTnv0yyNI8og
         OGu5bTecoEVzU+lIe1KbynRCEF5MEPqSLFp/6bPCZ/41Ln6+TZT0mBdQIXwQT0HgLTPq
         FuPQ==
X-Gm-Message-State: AOJu0Yyf7mzGbTmf1rr9+T4htTpRS3HH7P8x1a+ZkcJCyQgq6hKtrqLp
	k6Mz8QZekwbthXrBuZ10sF1yXrU+iigC0jwhSQ3tkvf6DemkQp8P
X-Google-Smtp-Source: AGHT+IEwH3j7284Asc1AoSJbpxlFnNXLpbQPnHcm+iXvKuo4m4alRm3DkGNRsiPg9bmdjIAkM7uR8E3PkVqsCc5OIEg=
X-Received: by 2002:a0d:d9d6:0:b0:589:fc81:952e with SMTP id
 b205-20020a0dd9d6000000b00589fc81952emr15210509ywe.7.1696854504573; Mon, 09
 Oct 2023 05:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com>
 <20230926.224630.1323587629112314285.fujita.tomonori@gmail.com>
 <CANiq72m-9pALVX3gS4N99+xhDK8rS=Wss0H+aBoUyrZTBwmV3w@mail.gmail.com> <20230927.201949.984780386551923087.fujita.tomonori@gmail.com>
In-Reply-To: <20230927.201949.984780386551923087.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 14:28:13 +0200
Message-ID: <CANiq72=VaNtZ_B0ji94xFftb4Pctfep+4c2cNWkmCcKhpZY2kQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 1:19=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> The latter. I think that to_result() would be more handy if it
> returns an integer in the happy path like:
>
> pub fn to_result(err: core::ffi::c_int) -> Result<core::ffi::c_int> {
>     if err < 0 {
>         Err(Error::from_errno(err))
>     } else {
>         Ok(err)
>     }
> }

We discussed this the other week in our weekly meeting and a few
alternatives too -- I will send a patch series on this (and related
bits).

Cheers,
Miguel
