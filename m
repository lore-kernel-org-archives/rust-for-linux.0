Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FB48C8B4
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879753; cv=none; b=E4JJQkHeaFU+1pTkBjExWLwyVkHhbzfT5Z7KzSZzznzJMZu5qwxWXvyz63RxIlO/HgpcKrEKb6rIfJj64qWFxMjGgkddZNIbqj59t9IV/08lGM3d2etZaaOePB9MkkAQRIm6a6k6tN+plyd6hcwwAZgkLH7gJX2zKL28bi4bUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879753; c=relaxed/simple;
	bh=1S+tu422wuis6/tZ2vSKuKD2LhSbT2f/mAsA8AgVywY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8Uxe2lQndpLfhDHtkyoQ/laqaSkOeWpVzJdl/1memnzJTDJ7KsRrxETpuJ5wpc5Ekav6gg+SArJrg3JlkMoZ7MCsVU6nktzm3Xa85Aj9osuuxn4VKjL059p0FjnLy8K1rCD5WslFetppdVsKNS/Es3NWf9TP4hfP8DY4Geurko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKHkeIIa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKHkeIIa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43246af170aso1088739f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767879750; x=1768484550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuB8LeaUuU12NZRvbDwmqGr7VISKQiEng/u87ABnUmg=;
        b=gKHkeIIa6+qR1L0CepHW3phrEtMpcExH5QG2TKbVwmeyJVr90IoEf2tGTjUDG0yaOj
         RFEYIzlTO3DeM1wdypzppbbm7SEVolT/32BCgiX/5ZkOX4V48dEClUHk0veVvCbPi1VC
         bF/MjRVTEsDMwCQh5WmKj9sUan3W3NutSzZl9SpXQ+K8rTYx2IPFE4aZQdK/CuvEF2+I
         755dpOKQKxe7n8xqXna9pcln932Wfh3YTYu9n/JO5IQrVppdIu5eLiEMufsDrRXI0iDy
         p0h7kYyxkXba2QM8R/jlsTuYefxU5hucSywkOVIo8hjQmqTPTrT4fr7tzVlw7IABRNid
         ZtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879750; x=1768484550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuB8LeaUuU12NZRvbDwmqGr7VISKQiEng/u87ABnUmg=;
        b=d8I52Vt72kLUsbTGmYGSN9C4Wbq90aAponfnRB+ufbpyZM5ULiptgwW4/9kkyJU+cS
         eFYaqMI3uSlwPVZ0FPNUcapNaiw6n1nON5lHv7g/8Tc/hIWFkUC1RwAWKzRYwWbKod2d
         XBN0GJFVwmzGTpeS1o3i9JlJNbSYC64+k+eYriHEfuaLkx5WQCTOvrcH4goCp068hfZK
         y9UKhD8t/BF6sSj+rBI6cL/ohAdjVUeIdzchhW/Vr3sZC/26D/4PfuwSZ1ib8KLvy8qb
         WDOvP9KK0LG7fhCO8ePcvVZMkKU6M6+MrwkUJhOFnuPunUIParnB9RF23nN3faGhfh6x
         1F3A==
X-Forwarded-Encrypted: i=1; AJvYcCVd1BEvS5rQKV6W4V7AI46bWq0G0C/eTvQ6g/y9uRyrXCl5qdiSiJXxqK3braoefAb5zJtzpw5XJC2KeVSBlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlesl1xbsey94Qja3vkHNFs6vs0SxWHEVWnl1dKQngxZ3zyCsf
	wJsCHrLC4U2eyL6davtbliHC6X8IdoGBR0/db3TpX8qCNInAIbOStjHM8R5Pijf+gVTYYsJg0i8
	22ebq4nr9BVXcs2OgYt/72Em55jIMfLELefMleMvn
X-Gm-Gg: AY/fxX73vJJCUHQDMVZLQ9gfdAzfqxmMIV9vJdyrrON4CdeAVmhs2I0SvsgaN/4AGmo
	rWqI/7MhIXOFq8r+7kmZRIWUjqnWbMvl9vvf1dQ1efKIdc/GfT5NOdqJivlcVuLgEpptP5EpMDR
	CEkn425Fcr+Gh8+WxKaouXP/qPfZQKvtwg51V8BtHzYes3vUEMm3SzX13ABG5q6ffbCxaRaTQAK
	9VcVcwxupxpRihS3lSClYMO88YdGktbPxGcnFYb7TsS5h1GfflNH6dEXOJcnFoK94ZuwdMPabXF
	GVf3ixGFPL4H9yB5p7QkKyyCyotRYRDj+0nUWjyKylae2Izh6e27nFkeWw==
X-Google-Smtp-Source: AGHT+IExWOEkyCLKUgDRVthn2SZknPs0kVAfglSywEbSBNIbCWLLC6QfR3LyA9uswU60dLniHiZXbHB2t4WQ0/bzApM=
X-Received: by 2002:a05:6000:238a:b0:432:c17c:3094 with SMTP id
 ffacd0b85a97d-432c17c349emr9810039f8f.3.1767879749526; Thu, 08 Jan 2026
 05:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com> <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com> <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
 <20260108125523.5c7810ae.gary@garyguo.net> <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
In-Reply-To: <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 14:42:17 +0100
X-Gm-Features: AQt7F2rpElxPKiqi8TNKEVozc5izmbhmGdSTR-9ZUc-Fg8J90AnYRHvNjmoDqyw
Message-ID: <CAH5fLgjjAO6n4EvWT-Q4+GmhL9v-gFw1PTzss5Ni3jWdNXqKmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print strings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 2:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> (Cc: Greg, Rafael)
>
> On Thu Jan 8, 2026 at 1:55 PM CET, Gary Guo wrote:
> > In very early days (before RfL is upstreamed), I had a prototype print
> > macro that is designed like this:
> >
> >       info!("foo"); // pr_info("foo\n");
> >       info!(target: dev, "foo"); // dev_info(dev, "foo\n");
> >       info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
> >       info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(d=
ev, "foo\n");
> >
> > There's a trait that is implemented for anything that can be used as a
> > printing target.
> >
> > I still think this is superior than just having our macro mimicking the=
 C
> > side (and as a result, having a lot of macros rather than just one for
> > each level).
>
> Why do you think this syntax is superior?
>
> One disadvantage for maintainers and reviewers would be that it is less
> convinient to grep for pr_*() vs dev_*(), which is something that people
> regularly get wrong. I.e. it regularly happens that people use pr_*() whe=
re they
> actually print in the context of a specific device.
>
> > I think with Rust printing machinary, `pr_cont` is rarely useful, inste=
ad
> > of calling `pr_info` followed by multiple `pr_cont`, you can just have =
a
> > custom `Display` implementation and print it in one go. This is also fr=
ee
> > from racing against another print and have your lines broken into two
> > parts.
>
> This I fully agree with.
>
> > I would be much in favour of vouching deleteing `pr_cont` entirely from
> > Rust codebase and always have newlines automatically added.
>
> I don't think it is a good idea to always add newlines. It might be fine =
if you
> only do C code or only do Rust code, but if you are switching back and fo=
rth, it
> is a horrible inconsistency for muscle memory.
>
> I'm pretty sure that this would turn into a generator for trivial fixup p=
atches
> either removing or adding the trailing '\n'. :)

What about triggering a build failure if you forget the newline?

For cases where the \n is intentionally omitted for use with pr_cont!,
we can add separate syntax for making this explicit:

pr_info!("hello! thi", cont);
pr_cont!("s tring is split\n");

This way, you can't forget the newline, but you can still omit it if
you really want to use pr_cont.

Alice
