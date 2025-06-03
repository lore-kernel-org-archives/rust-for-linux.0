Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B21A2643
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991243; cv=none; b=R1m+pgHgu+30inDKZOZLUxxlg4oqL3Jp/oqyChvmiPWqpLAt4lyQcs48tD36uIy+n7A7TGupKsfg8o8EPOF5vpHg697cekYVh9kw0PSaobRfQjSJTcTFUK8AEISQTxquQowO7/2ZL16ZlGZ/WyPgLPSt27u65N55B4f0slmxsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991243; c=relaxed/simple;
	bh=BezHkDhH8IsyV1FszV09GPvbFRmWxPPkDFdB5cspXI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ89XkB447y2Cr3wq8sxjTbmu34NvL2HdDoG868D96eyyYH6Xujq1wWTXfaN69ETg+YGbizteipDtZvm9tTmY1CwFDos8sMUIdXaqk3ZbQOLhCJANBC6nwnGRyKcMWLNFa/vX64vwH5KmGSkhlNiPaF5IkXXCVvg/oQIMIgVBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et8tTmxJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et8tTmxJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313067339e9so69688a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Jun 2025 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748991241; x=1749596041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnSfEe+i82HBMYcdFD1/gIBac6DNtSZjdfe2qiaYsPk=;
        b=et8tTmxJRzSfjvgoSLZVv6VF7ilRIOwxQ2eef1RuHb1QDO399x9iIiPrF1L7z1ZGe0
         6GHfX5JXp1pR9rCXkTvp/yX3D+LdNXD7cOyKNHIwbbEjSZs3AHqzzuVhbyvp00h41eto
         uxSZg8cxxNvufSSujQp6e6I7GVowvtE6RWJr9KlZiNOE+lJHzbakMhz5/m5YhzMQ+Sko
         jVQg62FNJc7GYH+oDY0o/DdzrknbVAapP8mZmO4WljHmQJQ/YEFMMgu9mhde8D9jxc91
         LIjSxNWc9VStxrV7MUTP99C5iYyvKBQoAe53+fcuPBcOTijLlbnhH7/C6ffnbmtrZvrW
         1EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748991241; x=1749596041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnSfEe+i82HBMYcdFD1/gIBac6DNtSZjdfe2qiaYsPk=;
        b=ooBu0baOvBZCMfq+FN8hTP0AGcoIkBqMLkyX+GBJBoZaQzPvSYCRFgQbPysWhwQkO9
         U5x6lvAblsfZutElCwtiQixHNwESbZRTyUBuPRGlVLhcS7EG9qKWLe7v3/a52xccDMDT
         x/bfpC56NmPyixKSF9mQI691y8AWv+ySbkr+YABJjtWApe6Dd9bU1nc+03pgq6773Lty
         HAjyv5lQhtVgBd6Ks5ErOC4BPEwaxpKcyWGhinj5DzIYCk31DvWQaSHwrQYnhdfW3w0g
         697nYnUUf5fEf5GbtZ7/daEW2jTwqACo+UhYgicvRsCh4/pprGETOHHiI6PcvSeNkbbV
         cZFw==
X-Forwarded-Encrypted: i=1; AJvYcCXyoTl5UdoVaZJGdVoI7vTuzja29TOxz+iK4Yrncpul1fWKCrkPyNkGEhG7g7lVbj3sxTPB8ItEdFS3RcDpnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJL6qZXbesdT+ANf0+iP1d+RilrlmLJxl3OUMMihZ01kvD/+K
	q6ui7I0KwJBT5oL+/VjJ/irOHg0RvUuckukSgEYoUPNIs2oKosyId6wslUUf9iOgN8fTvMdkV4r
	KYlAtieN+WtU2KzQovsWdeSpmEcpBZ7g=
X-Gm-Gg: ASbGncsTCQ9edw6xgMrGAveIh1ZchnkUc9K3VmWxXeYKe/7iOTJpJhwaHgcA5U/HnUq
	q1TnKAj6YN686qrAlcUvka/8XUF2iLP3EDK5tmCyeDDVDuJu8L1pA2VmF+Jiku2FPSRPhZFVaAW
	M1x+inQMwZnwAXSJ3VJUR845g8JYB80iYG
X-Google-Smtp-Source: AGHT+IGZYa4G23AxHyDqkwpvUikcMMrsHVuTEYvc6/YTGbJz/tSyWQnJvLIFquldlYvaVpty5JLVZSDLL1jLQ6MakO4=
X-Received: by 2002:a17:90b:5587:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-3130cd2f168mr398070a91.4.1748991241046; Tue, 03 Jun 2025
 15:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603195426.2360773-1-ttabi@nvidia.com>
In-Reply-To: <20250603195426.2360773-1-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 00:53:48 +0200
X-Gm-Features: AX0GCFtqkofNTFlU3jOmJsEEMWJ5r5MOjrCwwbjjZqvHim_veDBNKEnt1Iv9L10
Message-ID: <CANiq72nGZusApAFztsZOoLhRWJYEMmRY6XfAC89e4-dW6snC8Q@mail.gmail.com>
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, lossin@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 9:55=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote:
>
> +/// built-in file!() macro, which returns the full path of the current f=
ile.

This is missing a code span and it is still using a single sentence
for the "short title".

> +/// ```
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// ```

Examples are built and tested, so please make sure they work -- this
will likely fail to build, since `sfile!` is not imported nor in the
prelude.

> +        assert!(FILE.is_ascii()); // .as_bytes() does not support non-as=
cii filenames

We generally avoid comments after a statement, instead we typically
put them in the previous line.

Also: code span is missing, "ASCII", and we end them with periods.

> +        // Return the index of the last occurrence of `needle` in `hayst=
ack`,
> +        // or zero if not found.  We can't use rfind() because it's not =
const (yet).
> +        // Avoiding rfind() allows this macro to be evaluated at compile=
 time.

The first sentence should be `///`, and the rest a comment. It also
lacks code spans.

> +        // We use these unsafe functions because apparently indexing int=
o
> +        // a string using normal Rust methods is not completely const op=
eration.

Hmm... I am confused about what this is trying to say. `rfind` is not
const, but that does not imply "indexing into a string" is not const
(what "indexing into a string" means here?)

Also, we should try to avoid "apparently". And what does "not
completely const" mean here?

By the way, please use the standard "[...]" for patch titles -- you
can pass e.g. `-v2` to Git for that. (And ideally please provide `--base` t=
oo).

Thanks!

Cheers,
Miguel
