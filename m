Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32633403E6
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495039; cv=none; b=reSr5pITaEI1QVevckpjWiq1RY7zfdCzAv9RfTReJWka0Rz34lPr60erMysDQEFijNpetR7y8lV33o+I3LRsPAI5eSgsyDkH0hB9pYlrPUhVhVngbA+BvEXCYeahPWSERKskVYkuhr2mWduMgR1KJDn8yLjm6tnKlxH5MVyQgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495039; c=relaxed/simple;
	bh=R14yROkwNFOJsyh+gtZYAFcdxSoEQqrQd7yLNDuxlRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT6gCHrPvCuVzUe9gXoHJQorxTlRR95b9dDIbAaqa8FEwSlUorBAOvcbxl+4uH8WOvKX+ygK/PqpswE7DcTzw2iTeisBMWNjdAtGRxIjRjhYilHmFedDrYW123IFpngLmPENGJE0N3e9CsNun8g2K7U0cauWs2n7uomNQ51dhJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McLFegP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McLFegP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3095B1F00893
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780495035;
	bh=R14yROkwNFOJsyh+gtZYAFcdxSoEQqrQd7yLNDuxlRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=McLFegP2CGLF4MFvT80p3KV39W6gl4ZC/Ug7Er0lol12+fJTnXx6bnO2LaL7yxncX
	 3QttHUNrdj++UCa9Akv+Dd9ed8y+xPBDV61WX+yTWh726zrCen3gU/WhplmW41VF+B
	 OssWSZbsUPXbljGuI9cQjvz7PN4XGCbyiKq/cUIsnn8ZroUZ04Ot1QTX2Ngwc1xwG0
	 U4Woj8ZnY4K4TGjJyPsz54ed6uicF1FVdgZ+nnYSRtMP3gYp8+wIxOqEd6GTBuT1Y0
	 klf+cYhXc6R2777qX+Tygv03ebSax8W5HwFkLuhlP2MKqRtmqQNZlfBA8mQHuyFihr
	 Z3cmWmruIaSQA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396775c26e0so34368661fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 06:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9u+uTcBsB/StaqLMRgnddZcBuJkNlCf6LF1/PRg1gnfmTe7P9Lfp678lPWhuiJnALxEdnWId4rEg1WLOJq3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4tP4mwdeYwjWJSnYqIRZKpN13PmJnsUeqpDEroQlVAQesi7D
	qWSoCY7oV7LCvLiXz1LCa+/87xw6VbwKSKYLYk54RN7YoHhSF16skiU41vNGNeTs3/re3OghoMG
	FJDesM1YWiMa5627nsX0ltlIF0YsroDU=
X-Received: by 2002:a05:651c:1473:b0:396:9598:aa2d with SMTP id
 38308e7fff4ca-396af1cbd77mr12489681fa.1.1780495034012; Wed, 03 Jun 2026
 06:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rust-analyzer-macro-v2-1-bcf5bdeca1a1@gmail.com>
In-Reply-To: <20260520-rust-analyzer-macro-v2-1-bcf5bdeca1a1@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 3 Jun 2026 09:56:37 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kthg9=+_K6AJznHDvky5oQXJLq7ui+k=x-wQe-jzexyg@mail.gmail.com>
X-Gm-Features: AVHnY4LYD6EvXpZPMY8iCw-UFD7zE1d-jnqnRnxZs2UepKOYVk3ZJ6iOgOjljTg
Message-ID: <CAJ-ks9kthg9=+_K6AJznHDvky5oQXJLq7ui+k=x-wQe-jzexyg@mail.gmail.com>
Subject: Re: [PATCH v2] rust-analyzer: update generate_rust_analyzer to pass
 cfg to macros crate
To: Malte Wechter <maltewechter@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:47=E2=80=AFAM Malte Wechter <maltewechter@gmail.c=
om> wrote:
>
> The configuration passed to rust-analyzer for the `macros` create is
> different from the configuration used to build the crate. Update
> rust-analyzer configuration for the `macros` crate to reflect the
> settings used to compile the crate. Without this change, rust-analyzer
> does not understand conditional compilation gated by configuration
> redicates based on the `CONFIG_*`configuration values in the macros
> crate.
>
> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> ---
> We are currently moving the 'configfs_attrs' macro to a procedual impleme=
ntation,
> with this we wanted to gate the macro on CONFIG_CONFIGFS_FS, since the ma=
cros crate is
> build with these configurations since 36174d16 ("rust: kunit: support KUn=
it-mapped `assert!` macros in `#[test]`s").
> It compiles but rust-analyzer does not reflect this as adding:

Should this patch have a Fixes tag mentioning 36174d16?
