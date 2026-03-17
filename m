Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC33909B1
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783854; cv=pass; b=B08azqJn53bdoJCQLJ3BASuASECanlIKRGTXBd5r0jLAUKl7JRXMkqBdDIGBxnWu6BAJubGskm0zIaB6z3y4HejvvEQI9hvE8cM/EfXHhSDxq7RqZY1G2XqTMbTSxnLCBIerSWJkRR0P4GOVLDkY3sJ7IEvhh8ZGAzPXlnnzGMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783854; c=relaxed/simple;
	bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKnc5pFrS3Y9uqP8Dldzp4eA35v+7zQZ5YOeSCcoHWZfnMpxKfTfSdIdArxT030ghp4oDliCxWF7E3yg5lvsLJGWBHEwfE5pLnRyU7tDBqQGXVzyon8C8MEK2uEi41rBrNxHWOmCif5xCPkDMtVQjYddRUezAJNgCtokg8djO5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkvY+4Tv; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkvY+4Tv"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e6f5abb5so1894eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773783852; cv=none;
        d=google.com; s=arc-20240605;
        b=etpuVZbSMXtC7Hjrfi/uly3UxcOLh73rkb1JP0ze2nZx7gJ9fEATq07VEXQeC6qDfd
         49cxgOUUdCuohGXQqr3KQbkBYfOwKqMBCdq33cf8ZGsS5FCFZWZI1sWZovhKDveqjJA2
         BvxmH4vHOv5jVslv0fna9McQQ4Pf4awzwG8xiDE+F2CgZyXyIQwDCd9YKdpU7h7U/Aa1
         Bim21DEWusyrTkLnBFXVMUs2fiLijgOxbtGYHRr+VzALCMhdtEJuAHzt8pPWEZPYRmn6
         KHhauk0K4+wX2mBM1mZTHL/jRg9Gn7SuBE5osLh0/zhP9fgjLw6gljALL/0kWqKAImCB
         razQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        fh=gjq3cbVHdt2ZUlQqI6GVAJpT7VC8D7I/NaEZBOPIIGs=;
        b=WEFlTpUkruKNcmKo/w4UmrQkQ4DDcw/GqQB6aRovFX6g4Cg5gTO+RD1daLUe2ZJ6sd
         jTc+pZvE++xM/xvfUJQl/cw8Qlqlco3Kq/sHX9gLReqdHkZWSbaU3SMJlBHAjXGnEqiA
         SsHkkfxTKvpluAodnqhDF0lRp1BQu9GvVF2Ee5dJPaZWAm6a/v2NbQLOCTKjKvn+4MdI
         nhXrHII9qhK2h66R8qI9X959L+ZtKIuCwFq/ORmZVTN89yl7jq0PRsZanEMPPYyl6owN
         kEYR9m4iaV6WWszI7Ly51GFNFKMOz8Tn5D+qmFfYV1xvsrXEAipoFmYjqaP9KVL07RWA
         HL4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773783852; x=1774388652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        b=RkvY+4Tvzsh8OuFDEx0pvKsGKPKappqYeBSZUAiIqqyy4OoOvyLdepxYw5RUlNKqcf
         zqEQeBFOn6+2Pfdl5Bm+oJnE8ubCktgNyNP7c/0iO+59AFYyMYx6yLcWWgBwcuz20EYt
         l21DS+Htebj+DqxItdoC0kn60CVMisjJmK4AgPg3XR/5EX7D3rwl5VYIXuDeWQJCwxFN
         xh8v7wlOaa+n/6xK/YHjGWXo9OrqLDTaKfhcvHkQC0/cFpuxU9rCff3lFZH3Vs2eP6KV
         s5KH6eCNtXnKydYpS9fnmOQ8kwdHQVZimW6DWXWr53QqtuWdoo1u7O+6bLRuax9M6Sqc
         kjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783852; x=1774388652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        b=QefARtTJjCQascwa+j+0bLFwsouQSARO7uyqoS06VSdulhNpScLYwSRnEVbDh3H+rE
         0CzNQDEu31PVSeYaOdcnuDFHyUOZyqso/yO8vk6EA33CwjRrOSMJZVmwJ+FuT41bB2Ij
         IouDDCyT57vhp41O1WsOwuFkP8V8g4qKXa6SvzySfyyrKJguRFIRMN0AeK0eXDcr2bpw
         guGAd7YB9XHhq9qTxwhVhLyhTzTZ2AVTnu+RZ6pYlhlgx0Lz9Oxh1qLZJdcKrS+nSwli
         //utG29BZtU/F6PvOPmHbsxqH1LLW+j9vh/73YZVeoTssw0CsbH3QYpbPLKk+05xyrAw
         doCw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrrMYtQNySQ2ehHIjTKkVXp9kuxGuLhHQJdH5u1hAty53fknoPXkat8i3fwZ88uq9qnQePHGMInLkMxxc7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaFuf9zVrXF9+dznnsB654GxPBQxwY1HTZMywiecOlruscgpkc
	0ljoGQJCoNI+qu7Zi4paNU70IAJtf+juyISsMDtHW8eQYh+VnA9FpjmUZWn4yq7yWT6rMPu8e4r
	oLhO3rd4+zQ2YQJqDjXczVOQfygBGKME=
X-Gm-Gg: ATEYQzxmZhSEiarrOaaYWdcbJNtXR/cvxkGIvTHfHrrDh9tW+sssIAQZ7ENniGFG3GN
	/aNB0T3Ak1asOTZ9fUQbYJ8gf9Z2Q1gIicQdrTSPaXrHgYZjBiNJNlBh5UcXOZrDsBL9x1ehXeI
	QcoVixSMUiZveEe1JU2tOSZ2fODyAgYA5+KD71aAh+K2G4XV72T4ImOssGgjlDO2Z8uV/B/HzsN
	l4Y3FWCrLzaZzCDRSA4gxTvTC8Vk7yNGiZDZbUbkw/WuhlC5bmumDVO3FxleupIV/OgTsQ2TwFh
	TXeYBdfDbfdkJBbrRknYc1/RDHbhSVzFxGpF2o5TDuJLnv0sPTH7LZk84j9PCxdnakzggY6++Wg
	a/6IhKLmwSaJBDqIhQwUPS0jr4A0O3Rbz1w==
X-Received: by 2002:a05:7301:1e92:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c0e5071063mr268092eec.3.1773783852476; Tue, 17 Mar 2026
 14:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com> <20260316055736.1690546-3-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-3-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 22:43:58 +0100
X-Gm-Features: AaiRm507WQGSwKRMpz8g5KEGBHm5tKGpUppvaL_hlp_t4yPCn24PcuZMPKzTszo
Message-ID: <CANiq72=6y4Mn=i9MnqwTdL-a4ujABcYpWe2P54naR=rutpMS6w@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, mmaurer@google.com, 
	Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 6:58=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Since I think Danilo wants to pick this one up, with the documentation fixe=
d:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

By the way, there is a typo in both the arguments and errors -- there
is no `data` parameter (which I guess came from the other methods).

Since I imagine you will send a new version, please consider adding an
example, even if it doesn't run (like the others). If it did run, then
I would suggest exercising the error paths.

Thanks!

Cheers,
Miguel
