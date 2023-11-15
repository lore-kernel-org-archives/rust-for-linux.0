Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9vxk31Q"
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED79B0
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:24:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so201a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700083472; x=1700688272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsceDGuN2ajiTAgiuQyVgrST9Y5TBp5mlDRry6hTJDU=;
        b=Y9vxk31Q+gpbjzYHmO/00LZ3Un5EgaX2WptLuzElEuJJ6tQsPGEnDiwVnMrCASJgrE
         3S9C7IP71b4Sa1MTqQSHXTJpJYoBqZCzvmSjoopSSp6TX3QzHciB7+Aou4JOQOe/jNiR
         BEP/OjC4U9ar5DE5eVPdoh1vvgz+IvGD3+2JoW198yV46HmNsr+laaBNHPrVN0aO5Xb2
         m7EE5IFpRM9u4zLx5KgCaKvC/cDV5b3Cr7OXls8Tqrvft6npDPdOwC3XUivJUathxNae
         78D7I2DYQ1EBEikCxtSIEH9WlUNh6rtHGmr6gISHtQiwlr62v5m1WgtNRbILvu+S+ANl
         Ai0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700083473; x=1700688273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsceDGuN2ajiTAgiuQyVgrST9Y5TBp5mlDRry6hTJDU=;
        b=Ux4kA3tmgXh5GqsMPxwyUhwLAWuJupxiNMr0vzLtXFwEoe2cdsBdbOS7AB9OcTD9PP
         lEOehvfQCKJvtB0UIPb0z5UDOpp5THqOei5igSAF9rYgPJverA5MHJXkEnbtmFBj2WBy
         jKJPMXXwUhBkzzj0g4mj8O9NNAeR8B8l68dJbsWjssklSsJlYd/ZxT+xRSvhTT2ug6U1
         6kfJI15ALrxu0IkSmzp48OUAuNzCJ9LSU2Cy1f8LJl1vwHE8mWzeT4ZST6DOqzAb+/Tz
         NEB9/smJdcwUoXWhgJIK75f9CoWc2DGb2zUFU8wv2ah6K0lZgE7KMuC0b4f9WRRRrjRO
         ekHQ==
X-Gm-Message-State: AOJu0YwvDLylnAPJ+cE1yfitOM1p6ofpP8kHLJkk0muVeccAw9vcQJct
	YWMP8Yra0srjoDKJi/cBRHml1DAM0mrBqSyrJROsvQ==
X-Google-Smtp-Source: AGHT+IE7ZYcjN54B8pfXukaDEcedIKxoflQHt7QYFXwiwuXpwizS+NiUkvqcC3YcS2MhWVBzhH//erilzmWi7y4Dwg0=
X-Received: by 2002:a05:6402:17cb:b0:546:d479:9c90 with SMTP id
 s11-20020a05640217cb00b00546d4799c90mr14840edy.5.1700083472647; Wed, 15 Nov
 2023 13:24:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115185858.2110875-1-mmaurer@google.com> <CALNs47vtOJ8WcykEtXn==Fn77sqRt9nzPDek-c+625HPfWSx2A@mail.gmail.com>
 <CAGSQo01pE=V+NCdgp-1r_PAfn_48D4yXb91spHf8cZA0Z7GoLA@mail.gmail.com>
In-Reply-To: <CAGSQo01pE=V+NCdgp-1r_PAfn_48D4yXb91spHf8cZA0Z7GoLA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 15 Nov 2023 13:24:21 -0800
Message-ID: <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
Subject: Re: [PATCH 0/3] MODVERSIONS + RUST Redux
To: Trevor Gross <tmgross@umich.edu>
Cc: gary@garyguo.net, masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should I be sending all these patches to all the lists? I was trying
to follow the recommendations of get_maintainers.pl, which thought
modules were the only relevant folks for the export_modules patches.
(I also added Gary + Masahiro explicitly due to their involvement with
the previous approach.)

If I should be sending all the patches to all the lists, should I also
be adding all the suggested To/Cc lines for all the patches, or? I
didn't see any suggestions on how to approach this in
https://docs.kernel.org/process/submitting-patches.html#select-the-recipien=
ts-for-your-patch

Sorry for messing up the line wrapping in the cover letter, and if I
re-send I'll fix that, but it doesn't seem worth resending until I
know how I should be setting the To/Cc lines for each patch.


On Wed, Nov 15, 2023 at 1:23=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Should I be sending all these patches to all the lists? I was trying to f=
ollow the recommendations of get_maintainers.pl, which thought modules were=
 the only relevant folks for the export_modules patches. (I also added Gary=
 + Masahiro explicitly due to their involvement with the previous approach.=
)
>
> If I should be sending all the patches to all the lists, should I also be=
 adding all the suggested To/Cc lines for all the patches, or? I didn't see=
 any suggestions on how to approach this in https://docs.kernel.org/process=
/submitting-patches.html#select-the-recipients-for-your-patch
>
> Sorry for messing up the line wrapping in the cover letter, and if I re-s=
end I'll fix that, but it doesn't seem worth resending until I know how I s=
hould be setting the To/Cc lines for each patch.
>
> On Wed, Nov 15, 2023 at 1:05=E2=80=AFPM Trevor Gross <tmgross@umich.edu> =
wrote:
>>
>> On Wed, Nov 15, 2023 at 1:59=E2=80=AFPM Matthew Maurer <mmaurer@google.c=
om> wrote:
>> >
>> > Support both MODVERSIONS and RUST by making symbol version information=
 extensible. This works by having a separate section per field, and allowin=
g iteration to work differently per field. The old module information remai=
ns available to allow existing kmod tools to continue to work on new module=
s if they are only looking for C information.
>> >
>> > This also gives us the ability to attach additional information to sym=
bol versioning (e.g. namespacing) should it become necessary in the future =
without breaking backwards compatibility - new sections will be added, but =
existing tools will still find all their information and keep the existing =
format.
>> >
>> > PPC has a hack around removing leading dots in symvers. I have
>> > replicated this hack for the new format, but without context for why
>> > this was being done, I can't test that it works as expected.
>> >
>> > This was inspired by Masahiro Yamada's suggestion[1] when discussing t=
he previous attempt.
>> > Link: https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=3DhWr9=3D=
E7bTf+MvgJ+NXT3aZNwg@mail.gmail.com/
>> >
>> > Matthew Maurer (3):
>> >   export_report.pl: Rehabilitate script
>> >   modpost: Extended modversion support
>> >   export_report: Use new version info format
>> >
>> >  arch/powerpc/kernel/module_64.c | 24 +++++++++-
>> >  init/Kconfig                    |  1 -
>> >  kernel/module/internal.h        | 16 ++++++-
>> >  kernel/module/main.c            |  9 +++-
>> >  kernel/module/version.c         | 77 ++++++++++++++++++++++++++++++++=
+
>> >  scripts/export_report.pl        | 17 +++++---
>> >  scripts/mod/modpost.c           | 33 ++++++++++++--
>> >  7 files changed, 161 insertions(+), 16 deletions(-)
>> >
>> > --
>> > 2.43.0.rc0.421.g78406f8d94-goog
>>
>> Hi Matthew,
>>
>> You may want to resend this patch. For whatever reason, the RFL list
>> only received 0/3 and 2/3 [1], and it looks like the other relevant
>> lists only received 2/3 [2].
>>
>> Also seems like text wrapping is off for 0/3 :)
>>
>> - Trevor
>>
>> [1]: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mma=
urer@google.com/T/#t
>> [2]: https://lore.kernel.org/linux-modules/20231115185858.2110875-3-mmau=
rer@google.com/T/#u
