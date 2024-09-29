Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2F1DFF0
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727645921; cv=none; b=GVXpenEpilPZPBEkTmcc03vZA3mr/m691D63hggn4htqVzuMLoTEmICCJ3YVcWQ/f4N2RgfdQTxImJpUlkJtpHjf77Lz9wuRfTgSD9Mw/aRFTQ6fF77bMIyxsYWU3MBT1q63hgK6aGTf89V0ismLWd8HE107Jh/5BW/JhGvol6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727645921; c=relaxed/simple;
	bh=ZNY9VyfDM9tqtA90xwrR2HvYJHZ8XZv734O9gqNA8mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjxnd3X8bG5q/loeT+DbPOTvhyx1DEDdskXpQPvCdzYEtGey+/mYP/LQlTA0dqdraRm28NVNlQnX+OR5xXqgCXueWZcOnlFED+ZaqoMxsw2EgaskW/HS3kztQ+dLf/3ZM5B9o+dE4WAqczRC1ER0Gfj8LEN2wGp5dJ/IaM+3s4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=PeczMUKU; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="PeczMUKU"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e23aa29408so29021397b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727645919; x=1728250719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNY9VyfDM9tqtA90xwrR2HvYJHZ8XZv734O9gqNA8mk=;
        b=PeczMUKUZyGqm37d+2hfAyeGrB1BtibiJcEE+uGJ2GuZ4c6gIRyDDESN/cokOHgwwC
         u+zizlHZNemtyBnjxrSTM5gRkUOMivDvjgzT6uJiUqHBkjzz6KaKPK2Qdn1wFlX8Mujl
         EJkSTWXRcnYS2SsOe/UUXrxTiRQbpDTrocSO84SF5V6BJ/2/Y5aXvA3VNMDF7u/6ISTr
         v547zeS8otpGJztXfkWMcjaZPWe8r6HLzafG8PKSZwyc2lnuntdGGAn16F3pV1os8EYc
         +h7LZk2YBvzdNzJgEWR2clIicJVMwKzBk8vlqmlGl1pxaSr8/k+tK1BMBPp9DrGyzCTV
         eTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727645919; x=1728250719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNY9VyfDM9tqtA90xwrR2HvYJHZ8XZv734O9gqNA8mk=;
        b=ssF5OVrBkFsyVMUJu86DkBcsZX0buwvZB8hR+VGQqBAYl/TYZD1RCs+eL9txsnuOYb
         LtLn5TTDSVpec+FBkuLyMeoVUWQl5yGlixGz9/apN1iloqJTkyFOu0ZLEzi6HatUBNuq
         7rKXtVZcOtSwkkMuHvjHowMT45hYkOoBCATisYc6Pf1FtkGvphEMj8pCvmOk0WLKbpAv
         OcFhf+W++eGYfkBDJOpSGF/X6pgaWP/v3VZ+klouDYqsUPmpTjDyme59Gzr6NPzYWa70
         HVOZPR7oMls1TugVj4d36zG70ii75MnBOHZXYQmjcOF3hZtFoXJNZa+W+gP32ZyMix+H
         SRHA==
X-Forwarded-Encrypted: i=1; AJvYcCVM68G6XI/vTZQnBp79ieMdnfcd/TA9MZOvBk1Ipxp+p/2xOh+JnTEfOSSjE9W3I/ZJEqcF5M7m0ucd0yxyIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNr0faxS2KH4/woxsqtTmDT//JT2QT1XsXiTCypMOVqXdr5IMj
	2e3hZP9Ee3Mr7+Vul++92AC7+arzgyZhpRbZbOLr3PBqVR+2pLWzSXpXFOs53jf8lft2S4bCYMt
	aYAlAZj3wmk2UqYKXqjJ5jdUJotpKlMSQmsVl0Q==
X-Google-Smtp-Source: AGHT+IE+itK6MB0ZFmcjaz39EOyDbuNYm2rO49VdiYLG7uciGvFfjCMrV44OlHc+8UYdxJ+Af2ZKwF8W3CE1I2PLRVw=
X-Received: by 2002:a05:690c:4b92:b0:64b:b7e:3313 with SMTP id
 00721157ae682-6e245331712mr80972767b3.13.1727645918737; Sun, 29 Sep 2024
 14:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918212052.8790-1-nells@linux.microsoft.com>
In-Reply-To: <20240918212052.8790-1-nells@linux.microsoft.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 17:38:28 -0400
Message-ID: <CALNs47tAL3yCXuHAOtp12VascnmFbE384VwnupyWtHB9vc3+3Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: Add examples for the `Either` type
To: Nell Shamrell-Harrington <nells@linux.microsoft.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	linux@obei.io, kernel@valentinobst.de, kent.overstreet@gmail.com, 
	matthew.d.roper@intel.com, kartikprajapati987@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 5:21=E2=80=AFPM Nell Shamrell-Harrington
<nells@linux.microsoft.com> wrote:
>
> Add examples for the `Either` type
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
