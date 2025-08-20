Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0EC7FBA2
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755650574; cv=none; b=m1rj8MWDhLfsQGaeCn8iX7sesvhzXyDrHXZyttTSQZfn3jB8d02eDm+yM7liTSDrOhNwNCJbqb9Nw7BrVrjRptrmSgjU3J4pKTRWVsadNAPzEtoqQCTNjUR/zVAJVjSGBzF45MHSX5tY1+2VJ9J1fRBY5eQhoolxAE1dnkp8m64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755650574; c=relaxed/simple;
	bh=Cob62gZxusezzELlnbEq1p53FOmb982R7fyEQt/FObc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnU7+FFPf3pgKbieGXdGqDttGtCSTZ3XfReXMv6Gd15uMkqxWGZ6tNRZxDI5T7l7RzST38TP+RQjkBehzWeXYUvPHqxY2QwZF1CxofK/439XMRY8K18OBKdzefHc34ntfinHY0kUHENBa1QCn1mZ2pP8III0NeJjvDcqT9YYtz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pr3y3ZWH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pr3y3ZWH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61a207a248cso7344a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755650571; x=1756255371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRY2HHTE2P+K8s/S+rilfuFwP5JHuBgmUKUOpxbgTw8=;
        b=Pr3y3ZWHyleMFafg8LPJ3V1ffDsmzx+fZ7UtPv8mXRydU3iOpiBIehQzSzDzZvsC4M
         xHQEhmCSvdV2AK4uIlOtOukC+hW4kTPRYVtZ3YvfDRH9zLZnfeF6Q+lTFT3bJ2IfFjUv
         /wAV6H2iofmofeZeRq+YWVjxMQ8cvuTAbEf98m/ulJ6Z1efA+mtkoosNkQIKFoowNiCv
         9ERejeI+lMey57gptB+QBUBgwXrIHNEcBdYxV1P3DilT9NBhXy+RhiHRysEvmB7PcnAa
         fD7EoGpXPyMPkWbgat0gLeq2XYOeP6msczMjwZoGrGEM1N7un52Zdq2zxo8PCr9Z6pMI
         M76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755650571; x=1756255371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRY2HHTE2P+K8s/S+rilfuFwP5JHuBgmUKUOpxbgTw8=;
        b=S6bHD+GTxeTsN/7qBJLdUmlAyNFHoY9HJ93sSKLyCqW9um5A3wCHEPE+J4oRbYhumR
         ZexszN07z+fRrCkm6tg4WmZ4PWhDbSStB4uXrJey9fZmm5ZA2sKqIYpSPABN4ilIO53I
         qpg0EXZAWwF1zpBLCw/4+O4EUuSLnYoSkpmT7KnCadDzerQ/TznagEiEPA+/sy/UoGtV
         fGJefzFNTaPg4/exj4BAjTn29j+8TJxYMLDRA5W2ZbVwCAPkyI4L6ZyvwTQS0rJdWUIY
         Bn7PEtljQlNFwfoh7b/VJPVNY3q7BgGDOxjeyuEsGlM1DtcPA1tTT1gITM4AmEBpPO6H
         YQCw==
X-Forwarded-Encrypted: i=1; AJvYcCW1BOx7kEaTilnj904bTOmugRdqTjmSGJ1gOOpvsxdcs8SiqSc81ebsIYofsjA7daDZS4M77WYWJjMhvpwAxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+ucMBKvFcu6//Krk1Dy/veNnl2ts2T2Z3enT77rpeRPa56mY
	1rN+dxgBIadX0tIYCOoJva7FkvhspmmPWyKNrOpyXobURS7ypVJLWSd8NE7zEFUsuMpR+w9id2c
	3Mpr7I5xBZzSYGy4q1/Xt07zzoOQh6cITzkXoiQkx
X-Gm-Gg: ASbGncuKuxr7RHAvXmFMskT1/E6b0/XzXCJssC+MZPYB/iTMhoP7r27edsMdy94LTa6
	n6gDu+4ZSI+ksxb+U0cmcRGu5X108LeRAmIbAu2JH96pL/RIBKPW0OBTzpvo+rEqstunxbHd/pN
	hgo8sDDEsJ3ZXbdThjBG7MSUyw+W1WrQ1bwjcZfLpGnmu7c7FRGbzVMIOsnEQGRt1cJ9FW9gs5Q
	2MQVZ/wR3+wkhAn+tPD+BLzg++piXRiaPl7oK+1vkC2ptc=
X-Google-Smtp-Source: AGHT+IGuz8vfN8gEV0TKku2fAZ8eu2a5NT+0eZgcslCi1URyxVb8cDu2+2BIr1gze0SjMpjpLVjWMIgz712UaGsS8aY=
X-Received: by 2002:a05:6402:a18b:b0:618:526e:c94e with SMTP id
 4fb4d7f45d1cf-61a9b4bdb38mr16848a12.7.1755650570567; Tue, 19 Aug 2025
 17:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-debugfs-rust-v10-0-86e20f3cf3bb@google.com>
 <20250819-debugfs-rust-v10-5-86e20f3cf3bb@google.com> <DC6U02DZSX1W.1SXD7XQTNHXQL@kernel.org>
 <CAGSQo02f6FOZ6fujzUhJEbysDpuASJf+4NBfqj0NGHKy7GQ7Yw@mail.gmail.com>
In-Reply-To: <CAGSQo02f6FOZ6fujzUhJEbysDpuASJf+4NBfqj0NGHKy7GQ7Yw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 19 Aug 2025 17:42:36 -0700
X-Gm-Features: Ac12FXzAfLXmm8Kg-LTW0BIxsriMcYffv1nZCRxJddb6RaAyZiCI7mxexudtt6c
Message-ID: <CAGSQo00m_VBpJ+Vez8e_dBNkxGaTjtA+eDcpcd9zzjLsLyFe1w@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] samples: rust: Add debugfs sample driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 5:40=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Tue, Aug 19, 2025 at 5:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Wed Aug 20, 2025 at 12:53 AM CEST, Matthew Maurer wrote:
> > > Adds a new sample driver that demonstrates the debugfs APIs.
> > >
> > > The driver creates a directory in debugfs and populates it with a few
> > > files:
> > > - A read-only file that displays a fwnode property.
> > > - A read-write file that exposes an atomic counter.
> > > - A read-write file that exposes a custom struct.
> > >
> > > This sample serves as a basic example of how to use the `debugfs::Dir=
`
> > > and `debugfs::File` APIs to create and manage debugfs entries.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> >
> > This is a great example, thanks! I really like how the API turned out.
> >
> > When it comes to the newly added Scope API - and I assume this does not=
 come at
> > a surprise - I have some concerns.
>
> Yes, I expected this to be the case, but inspired by some of the
> comments about wanting to just create files off fields and forget
> about them, I wanted to take one more crack at it.
>
> >
> > But first, thanks a lot for posting the socinfo driver in both variants=
, with
> > and without the Scope API.
> >
> > I had a brief look at both of those and I can see why you want this.
> >
> > With the Scope thing you can indeed write things a bit more compressed =
(I think
> > in the patches the differences looks quite a bit bigger than it actuall=
y is,
> > because the scope-based one uses quite some code from the file-based on=
e).
> >
> > I think the downsides are mainly:
> >
> >   - The degree of complexity added for a rather specific use-case, that=
 is also
> >     perfectly representable with the file-based API.
> I don't *think* this is just for this use case - if I just wanted to
> improve the DebugFS use case, I'd mostly be looking at additional code
Edit: Socinfo use case
> for `pin-init` (adding an `Option` placement + a few ergonomic
> improvements to `pin_init` would slim off a large chunk of the code).
> The idea here was that a file might not always directly correspond to
> a field in a data structure, and the `File` API forces it to be one.
> We could decide that forcing every file to be a data structure field
> is a good idea, but I'm not certain it is.
> >
> >   - It makes it convinient to expose multiple fields grouped under the =
same lock
> >     as separate files, which design wise we shouln't encourage for the =
reasons
> >     we discussed in v8.
> It's still pretty convenient to do this with `File`. I don't know how
> common it'll be in kernel code, but in userspace Rust, `Arc<Mutex<T>>`
> is a very common primitive. I would be unsurprised to see someone use
> this pattern to expose separate fields as separate files if we go with
> the `File` API.
> >
> > I think for the sake of getting this series merged, which I would reall=
y love to
> > see, I think we should focus on the file-based API first. Once we got t=
his
> > landed I think we can still revisit the Scope idea and have some more d=
iscussion
> > about it.
>
> This is why I put the scope API and sample as patches on the end chain
> of the series - it is possible to merge only the `File`-based API if
> that's what we want to do first, and consider the rest later.
>
> >
> > I will have a more detailed look tomorrow (at least for the patches 1-5=
).
> >
> > Thanks again for working on this!
> >
> > - Danilo
