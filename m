Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D806321AE
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idW6krcE"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A18A4
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 15:54:11 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7bbcc099fso18121387b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696978451; x=1697583251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAX7zu7f7mUP0QlROFyUiz7Z9SWFbn7gRC4WGY8QBQc=;
        b=idW6krcEoenhA95s8JIE60jJ9kvVPxbNoiNs0DgTHP7//L6kTr0p4cAfKiIkTPseb6
         PwyCN2Jcz7z+E9LoOQp6RPRggUHb1YqFUyVDj5zUVHNCTxlQjehZL/xEzbDIs/lrzfs9
         GQoiQb47BJhW6EBwwTUcB7KXhSUM7W3Gvmja2hYX8OgKpzfQZ4AQvfnil9Gv7bn0nyCH
         3EieWiRuUB1AHTAMRpyxAhQ64TGQjROGw1/hXC3TAZWoD0eH6wYLtLHKtuDKehsrfCJO
         LuYCxZIlBIfuSzPj7FhTYhhYvrEETY6LiwB3WrRK/YAszLGXyciqZQRoiSw0Aoe8wnxs
         m12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978451; x=1697583251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAX7zu7f7mUP0QlROFyUiz7Z9SWFbn7gRC4WGY8QBQc=;
        b=JDa8WnsV0EYCZzZogKpUd3R5uVkeyylsJOnPHYF69Hp19lJuyMCypj8eQQ/ZxJ83vq
         PCpNzN/BlcEkH/ikcoMp0wRBUSf5EXp0kDIyDov7QLhP6T6Y1hII6hxNeak+zmdYYntZ
         IJSZQv/Zl+0Z9SB4C5xsFrsSd5bUH1oPfJ5WqZ8zE9IEuPOJBSqyLomWMPiTjJ5Er7S9
         BPTfK5Qbvj0gGLDHhXc0H3h2M2FS9FZaK4TOLJp0kghOMaVLv9zfJ79KguPdHagAIVNC
         G11MsIr95PNnOZsA44VUhyCGNziodYRRRWIg+F9yFk0FEGTaXE47vNhoPBwtk5/EDPce
         1bxw==
X-Gm-Message-State: AOJu0YzthpshneYG8s/pNSRaoIFIHHak7MyHHQn1sCVWEqDOC3fZ86ez
	kLtk8Tg3uLxIuWTV53gxnGMP0YnsMNerTEghsB8=
X-Google-Smtp-Source: AGHT+IFA4F0VbKK1nSho9sV27w6Y2C4pKTKJXOqRlUdu2DKJy7bKJlH1yGQfEX/3OLDFIE8DP2EUUrxhym/dSX5ipEk=
X-Received: by 2002:a05:690c:3509:b0:5a7:dc7b:22 with SMTP id
 fq9-20020a05690c350900b005a7dc7b0022mr533363ywb.7.1696978450951; Tue, 10 Oct
 2023 15:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
In-Reply-To: <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Oct 2023 00:53:59 +0200
Message-ID: <CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Trevor Gross <tmgross@umich.edu>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 12:50=E2=80=AFAM Trevor Gross <tmgross@umich.edu> w=
rote:
>
> I agree, but there needs to be a way to use a driver more than once
> with different IDs. See
> https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+QMehx=
=3D1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/
> and the followup, maybe you have a better suggestion

Does it make sense to generate one of those based on the other, unless
both are provided, for instance?

Otherwise, we could perhaps have a common macro to handle the
"advanced" case, and a simpler one that calls into the first for the
simple cases.

Cheers,
Miguel
