Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC624070FB
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539403; cv=pass; b=bp9ZXiluoRlSh8wE8pxqVs93TUhDqHaJ4QIDNLPJ7Qj9/sYwlPEl4VgpOzJTeaMYldBWYOWvR4L0+eVLQ4r+3wJFR4gZMZsLD0SbrrK23KiAiWv9PUqEY6LOiOGxwo3qGmtxyvrcoEeah5vDPZMi9EykNcPnZ1XNjDujVnt7DqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539403; c=relaxed/simple;
	bh=Z7OnzV0NICFP/j+9LxYUARGbJQAT4QoQ0XE8vZ4nx5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hV7QvcC3aW/CH+zbZYTCNz87E1f4WoeLXx6fBdVDXY1QLS9o1sljjDW2d1QBmnA9lWl1uZ1jrHVxG0I+zpL3KdpWmzkyWs6MESeE/xHdl46VkQGC1kYO4twB3dT7+J5B5RdWdl/qCO+ScR7WGfMCcqWH7WH85oqRZFuEDVnF9h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXfwySVw; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXfwySVw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48541edecf9so13683825e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539400; cv=none;
        d=google.com; s=arc-20240605;
        b=TW5+8Rd/1wZKsfZSRGPlW1jwIirQXFl70tfpb8Q5yzkejhR4A+OCvx9KxV2XY9zOgv
         C86k2AF95uTzdwhb+wAmS6yv+TBtWE1AC431edGB/wJ72Nw25w12oEJ0zAH/fMsTvll5
         0TaqeddU4pLR8up3ohCuj10SQ7D6qxjDjeckyEH7EsOsieVlcwS41RItrdl/9/qf6XvK
         urk+6GILdHRrkMIHQZSgntJvnIAHRiz/EbpEsn2Pf+w7FLs/q6qHid3O1KZuYxHdFeg6
         YAT+urcEiFEEkW/U5kRab98ruzAn773m7UD9EWs6y947QKNcJkdtVbmemIPAEZXlJZkL
         YrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVUJdOtjMVLPcCHe5HdcxQkI21k69qCxIBe2YFRdubU=;
        fh=UYvKdrE6jUR2MjG9vynhJY8XLym/UYjyTXz8r6nbSf0=;
        b=chNAB8QA5xTkcQlX2Xi/xq/u7SZ7tfOORwR326b6s/FN1LX1Vj9y8y92E/1dpHW/lY
         nfwh8GfJ0TmRVJB3G6xbxuiEBdqrwym5YCCtdtoqAFUm0WgUmLOXv5zRokxD8MggdRMA
         XAynuwLOelYR79mLLvA0wUY6FM91S9OetjY7SOX8iVJWTPfmcduPPkL8t1OjMO2zr0Hm
         PDWpVlshw0xgilLxXGTUPeQrXGPoFsjQa2cWDHO6lzIzklhZxYmnd3+1AT2lDtPpIBpo
         L9RY4pYUAol9skXSbQYSkH0ZE7pxOeHx707F8EGQAr5UTkiif1BoEZV1XZVypu49oUJ4
         5yWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774539400; x=1775144200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVUJdOtjMVLPcCHe5HdcxQkI21k69qCxIBe2YFRdubU=;
        b=uXfwySVwcsQsymuAVvGVQOkUZM7+6vEZ/CrANmiojsxQhEqsQWhXbB7aPKpDyZn9DQ
         W7GAEnJCzjPuIWlLpzYODfAyb9+rY7JHPXp3xnwn9ThBhs8GUuyoKCWJyjoiDwloiJh4
         DFg4ePbzwxyx1RQ5/j+Bhl3wXzPYvyPe2IqNiGr/ki1IZemWLWqBfGtwH3WohV1eYD7Z
         saTkRrzWLnWBkzgRSAEEdMSjyi3lG57ba4zcK8ukxfdGDcLp2ydsHS9FwRvLM/jd0kFD
         CQwjZEmWvl1vkfCvty2rkL5RMTVyTpDa6Oefp6bp4nTn/sGkgH+fD6q0eeCcsyHQBVfi
         k29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539400; x=1775144200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVUJdOtjMVLPcCHe5HdcxQkI21k69qCxIBe2YFRdubU=;
        b=HcBSwb9o23e4NYie85vX9eoDYrXJgtKSKBVv132Ek4hBFDdwT1UMpkCq8yftA4pFNr
         QG8ojW1O5HxHW7D2WpQne0/8v30q9IJJ/PbwZgThSgm/AMVUNM2FiXtsCevHDvm7NXXK
         5TQw93eo3NLbaqmDs6LeT/BDG7TbvywjCv87zsJR3Ic9LOarm4e0dsCf68TzZWxvzdVk
         vZijMWXszGbFJ73DD2DuPAlUDm3J+AA+mwVFCX6PZpVjHSvqPhE2Y7PgG47n2KC3uWdA
         hDV6XGnec4aROOBT7YufNnFHJo+5vQQjtB+XN1AWGrF0poDmOPqOoQo+4fhgDefmd5VT
         h5YA==
X-Forwarded-Encrypted: i=1; AJvYcCX1uLK9DRv6i1xrX6TmGVB+L6JrkUfzlpq1EbSTeaTzFfEOwgk781l3VKpjvHUxKlo6X9QDxMM6XyRqukgL7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRR/ZeVs16vEpY+zTEFMegfwDDkeukY28J18MMO8yaEGl2oXO
	mvMbJXCxqyw4lxtZ7ppvilAZgLnA3I003fnQmDIoZqifMkPEOUCt7Mz4CKjZT94VNBn8fS9ym+A
	RJXNgHZBZuEAkieQ8Gohf/hlBqsbg2oHZbkClCbwr
X-Gm-Gg: ATEYQzxDKSDKcA/NnmbkNytcoM9sraCP4CzeBH3DnVYqeDyQsbXza4xaHD1PpdDG0W2
	MkG7ZNvZwz/RXKewMHlPAZ2MEE2jcqMmIlWmyFDowK8zfvlbFLCVTt2dIbEp490MJRNz1JXHFMy
	YTsrgqQW3wmoxsjhnVFAM36rxWGxBsYPt08c6SWH0udLiJRPW/CqUAea6jiwyH8anK5d1pLHwEh
	YV9kVhG0PK8cuHms0SKuofS0iGqX0sypVo8tDpfWl5iEyJ7eSctiUMVT5UN1ivibI91gFytmHdb
	RTdvSRggmd4deF1M5wd9FMX2U9AyByCCdRIq9w==
X-Received: by 2002:a05:600c:8283:b0:485:3a22:69b9 with SMTP id
 5b1f17b1804b1-48716099758mr115935205e9.29.1774539399691; Thu, 26 Mar 2026
 08:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com> <a6fca446-ea09-42bd-a4a4-436e0dcedd03@kernel.org>
In-Reply-To: <a6fca446-ea09-42bd-a4a4-436e0dcedd03@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:36:27 +0100
X-Gm-Features: AQROBzBaQ7mNWIBO_7q2my-s0kfnUb7NSQGi88bXHPQVSbBaaQd7x7NOYvChrPM
Message-ID: <CAH5fLghfcb-z=peHb07-rspe5WKJOg9uYkWAN_eCQqT7EEw2ng@mail.gmail.com>
Subject: Re: [drm-rust-next PATCH 0/2] Fix sync::aref imports
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 3/26/26 4:25 PM, Alice Ryhl wrote:
> > Alice Ryhl (2):
> >       rust: workqueue: use new sync::aref path for imports
> >       rust: drm: use new sync::aref path for imports
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
> You may want to use kernel formatting style though. :P

lol I forgot
