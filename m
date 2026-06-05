Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F86A3321A1
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683470; cv=pass; b=ttfGTka54djRow/yMJxRJf4ai4TCQ/BVgt4dniTisqB+Lj8T88WpnzHd/51NjTrYuA68oBInJxOB9+YgCo3LC/oxTzBY65RdUhMn5wnSS9WoWFOFWcBCFwfFvTqFL11eR/83zbmUn1nvGPCDAQnRdviXBPn9JAB0NbROCZugFeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683470; c=relaxed/simple;
	bh=SUV8bIa7xH5CwJGgUZXFR3xAEViJqnFPZn3YTV50FSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJEKJ6g1pEnVRloCblCnuGOs44ZWG2u+qXAjJWhSOBiqclTcoLjrzCXNB9CKchdHRqt1x+LcsCV0e5Ggr7h5c3lj8c5ZTD3wQsGRrLRivydKfKXbqyXrhC685M57M2wK396nXKCjyhF7k7X779x5qRS49AHwKg0Wfxad7v7iuj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvM7EJaD; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvM7EJaD"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304e86ecebfso122815eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 11:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780683468; cv=none;
        d=google.com; s=arc-20240605;
        b=FX83q11vdizvqV4SBONUXg0VxH71I0NFbXp2NpLN8Hk9oH+fTNrJ0f7rgAGfPt6twi
         eTEyiyZFUos9M1/2uiJAPGBvrWn4XdEev09C4j2Oe5tmetlpv2xxtJncwTRg/GOg6QDX
         T/LoEX1Qarnp+eHasZNsbq+b0vaVlLpJ1F/BfcBg9JD6vyxTfGQjU80Pg/Q82Po91PcI
         tfZdn1Hyrrg07g1lTrk4L4JkSppy1ULPBSvh622dH2zozx9+68NNWkVyh2f2c6u7gBIQ
         LTnNyHGlHxZvbsNbqGDICGASY9ka9b2D1S1oPXIYNWmQG35UGQgE+a2+qV6ETpKzp0KT
         NJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbNioASDYiYe7m9hRLWRsYGED5pw3vxbOwy669aTpMs=;
        fh=6j1WQEwrBX8s0nx4jltO6qmLWRvLcQq8g1qFmGy8RKk=;
        b=iZjzGFOo4YO8TonfL26Kw4fQMV7SBRLn1V6RDm87vvHMjEeCDYE/dwQwPcwN+l3nwx
         vd+NB7d90+ajK4+j7PtlnyLCKOVlfc6/34C6ACYSJBEzHU6AgJLAy4d4oMk89hWSIc+O
         0rhwZbgcoiAK1uFKkYQyuLqWJUxNVfVkl2HEOTX70S53jrZ9jXe12yB1TpVogy1udxvq
         FnssyAAroBv5iZE3UkapLf2ET/ilb1HRsQJjE982lbSPXq/aCW2qLoNnyK1QjGEzc25y
         MyZRMS0USC/x/qt7Dbr2VRW1GqTHV0xQG7BbFEEoJJbQCBx7uC3B8zJF1kbvKhz8XAkG
         8e7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780683468; x=1781288268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbNioASDYiYe7m9hRLWRsYGED5pw3vxbOwy669aTpMs=;
        b=DvM7EJaDTE0ojJ73wSdgGRbMneqw98O7PEa9OEMm3QVJAdMuDzkDNE5uRgPNGqQOav
         OZ5nPAUx8hLFrvJ7i4cSMFcO4bvB56D0JjEBkeMW/VKy0dBdhZEZmWByfd1mqv2kcyoi
         P00IV9cV34DV4QR5P+djgk1vYjZ6h/lr6lt7VIrFIA3cBI21eudZqMJ1sglD9HojcmIc
         MBBYRfKi+njIPeNLzboepnEKYjgaUjABfrT3btc0+LEBoT9yJcDoPjtg4Yuvbmzjzb0F
         YQy6ECVut03hfaHwk+I1rG5fRy59Pq9fGDuynWwpXeVUG+zELK0FHj0Q6VhNHtuk6owZ
         2dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683468; x=1781288268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbNioASDYiYe7m9hRLWRsYGED5pw3vxbOwy669aTpMs=;
        b=HDmoQ9q5eMR7sIgBaEa/5UsyFvD3D+hiRukesazGjUqxe/J98YxEfdYMaGNZfvGRIh
         iitLK868tCMmhk3io9Tbfn+c3/pyCwo9qAzWGiCg3kpq865E13weJK0jKp70VkJNrLkk
         4TCeWW4BAYeIsyqVwaWI7uAHys8OceurZ4AnaGU5/ijXjwHOT1HH0+pjdQ3ZH07phChd
         Wij4ku2gXHJ72xSeOqvU0lIcopfmJu7kBAYRdSy9/vRXJxDhsSBHVtu6SfFMC+NdfYyO
         fecKX0KyLtk4rMEJxS7tPmN9G9DDUJ8fKp2nOfYop4WGlgi6JTa/c6f14qQAz+DOyfLt
         vUIA==
X-Forwarded-Encrypted: i=1; AFNElJ9vzNRjosv3xyvFsGrdoHMk9wVk+J/CqtJTDugSFkgU9J4zJRrAUdTQm23J2b4hgtG7dC2M7sDEGcE6ipvsdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmwVsc/BoCScIx1dEzoAGqjfvhHLzxev19TYp7EhVkRcFaPWM
	ND+cBPbe6LTDyjQBxUZGQKRsQC5LncSu3cfsPVMV+z+c87d6of8Z7g2YqSs4ZhW9stYjMiHnTeL
	DAgeu5zCVyy2ZKFR9k2LUpL2o8xfdE5o=
X-Gm-Gg: Acq92OFcLS89RcBAVBZawR9dzr9sgWlUCD8h8nYETKerEhxsiroAafjTNs2ZAJmFZE3
	2bo2nQ13u7HV7mfJA5bg0c1Ke2Kczd7irNY0UoFkCUVWOesFYzPJ9RcJXG9aQVB6YM2/KkY+1vT
	T3iHDDFtHoiArzcxDzNq2AAulzoVmaawlPY+jD4lJzp4xfIZFsRhpdBMu8tWgnsGhNiTDoegg3K
	5q58sqdGUiBZO9CLMcDy4biBa/4LTjmay84lwBSzbhCOfXD1dk/z/awcKGsGaOJ8uF1PiNt43aM
	c/D5w/muAPWbJL3wRLynu7RQXXLOscFKQCVyXs+0earhJQ0QyumLnW1whWA1p0UjkPzljeiRua6
	C5pC600fL0i1dpX7WOX81TfxBjD+YvAKVGQ==
X-Received: by 2002:a05:693c:2c11:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-3077b452789mr1193477eec.8.1780683468446; Fri, 05 Jun 2026
 11:17:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org> <20260605-impl-flags-additions-v2-1-0d27242f460b@kernel.org>
In-Reply-To: <20260605-impl-flags-additions-v2-1-0d27242f460b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 20:17:35 +0200
X-Gm-Features: AVVi8CcSgmL6cbr5JoQ59E735TxcScRTrrOutp7KvaK9Qv6FIXdKOMjRoZ-Tf_A
Message-ID: <CANiq72ni6fg=C7Q_uXBH5mvOkdkOCdpSeKzejZ6OhxqsgqLw-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: impl_flags: add conversion functions
To: Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> +                if value & !$flags::all_bits() !=3D 0 {

Can't this also be `Self`?

Cheers,
Miguel
