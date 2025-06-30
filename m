Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1B285C90
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304880; cv=none; b=csCIvrGETRwz3Dn2enZNftWfNAmeeFtcEQgQuuK5r7PvmN3JLFP7dVoKnaFFowo6ii8BALDPWTTH4b372E0Mw5TRD3YaIbmpRfWfzzHkh1uaIwQs1LNU6elCjGtqzJTQsBr8XVMF+hGpfddda9OdvzrBMCkAwFZeAc6bb+BD/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304880; c=relaxed/simple;
	bh=txN0VoHoERiQwtI1Nj+OyWBtIGfofmvwvy5Z+6fKswE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/kzBkAT0oi+GChjgyNpGty8W6XSNpWkKcXJzhuv0O77jn69XVhVVkbs+t0BDAjY/aqTlXZXJwBdCTMyzecoaVIs5wgrRcgwkCx5lf1J7JqgT4v+++GrFtHqzQqgp08tK5nARWbzuWxsJaiOz3osmPAFGS0WljfGp5euYbNAjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bOSl+d4z; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bOSl+d4z"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso776a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751304876; x=1751909676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pKzmp6risezVpFGNptctw5AXsTBYcK3o9vyNICCack=;
        b=bOSl+d4zbXcqJgA4lR9P7TWThBJn7BMVEa7dKUPM6FJhZXUysq5NQX0JyqhBUbokIs
         Qeu9wOhBnLFjqG2OkndJ39ak1M4qdjpR6MnuUzf4x1vBPk9/aP17gCq8/yDU4tquNFJs
         f950Z3LDv3Gc3T7Os888/p/DZIK9h1l12BhIhn225f+ooJkTIyqNRl513/guptGGNIco
         9iaeHWRSazA/5a7dJz4q57N97cCXi05+84UBr62dZkYCWZoZGuXER/iYYxMiBs5Ym7sT
         GV0stDuT1YUvi6mphp97/xT8Qq8GSuGwPI8c4yYXhMwq2ZRG+g1nUavWoMXi4gSZfqQT
         iHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304876; x=1751909676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pKzmp6risezVpFGNptctw5AXsTBYcK3o9vyNICCack=;
        b=lb73AiNbdqigws23yQwO6GWQGgpdcrlh+753elofDhhRkBFLQj2YHegDL17BfDElrB
         R1i6Myr7asw7XlnnlZWobIxp8L/z+lWK3eensoJ0UGc6fDZ3GpwLeQAdZq2ogP+FtDSD
         292y4na9O5PB+1FIDgQHvG69+8pKSNep6zEUy2BDgkfqZ0FGyNt7piOkpoJnIYG+FUql
         r75aVBKoB2R8kvrYOWkJDjxBvE2GYYBipwksvD8A8HBD+BkgjyuUTWG1Ey/hOiP7cVEu
         KSUi68kN6kk2H5YCuhf/edI7mrzCsQTICqert3AxIgNUMyHL91HS5TU+7nluI5NjesYk
         +/JA==
X-Forwarded-Encrypted: i=1; AJvYcCVIXqhIXF215Ol/TWDJ2yAmsjERjNJDWbJiuLtU4D4KWHVBbyAFGK0y/nXoG1Pq63UPWAfIdsguTptTY+F+zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXRomjSxMkPow1SHMwl7mqwWpe1o7F/jG5aL3b2E4HMNXVHUz
	ojZ+yLmE/sdVscOn+1rupm98u8Lx2xhr1wa2mzpkJ8P2naVMBgEWzu9eOxc6zAz3JcbueC605D/
	t421XoaxtZWVIY7KPDBolxn+0pEBFPn9liLQRpJPV
X-Gm-Gg: ASbGncv3omGmwoEKvE1kaIovVkJ+K2oGxp3Z4wKSv5BQLyBXzPa4c73fMRsGRfNuk1L
	c3K/SSkwNjBC+6LDJcrl/FTzM9tc0YMOvhuUBnMDMAHmexN7R9uyGFxhkKXLpX2t1vhbP++CpZx
	KCKlHoN8puueoqsDcs4B6H8EYlZ4wF1IkHxfExjzEakHftXLH0Y+iyWPvg/9QDghl/olJUD41Go
	w==
X-Google-Smtp-Source: AGHT+IFHj7916AmIiUe+DcYm9SP9mhlcNXyz2SvSx7ljxWn+C94mxIYjImsnFG/ILQQ5y8gfoDa3L4qM4h6FChZn+Fg=
X-Received: by 2002:a05:6402:2755:b0:60b:fd63:f7fc with SMTP id
 4fb4d7f45d1cf-60ca3db2409mr204595a12.4.1751304875964; Mon, 30 Jun 2025
 10:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com> <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
In-Reply-To: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 30 Jun 2025 10:34:19 -0700
X-Gm-Features: Ac12FXwQ3MQ56JYk1RmWEOzrCavTwHgT3pjucKgkfqXxUmfV5wjiWoi-zV43X9Q
Message-ID: <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) ->=
 File
> > +    where
> > +        for<'a> D::Borrowed<'a>: Display,
> > +    {
> > +        File {
> > +            _foreign: ForeignHolder::new(data),
> > +        }
> >       }
>
> What's the motivation for the ForeignHolder abstraction? Why not just mak=
e it
> File<D> and store data directly?

1. A `File<D>` can't be held in collection data structures as easily
unless all your files contain the *same* backing type.
2. None of the APIs or potential APIs for `File` care about which type
it's wrapping, nor are they supposed to. If nothing you can do with a
`File` is different depending on the backing type, making it
polymorphic is just needlessly confusing.
