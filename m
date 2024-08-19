Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D81E15624B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724051475; cv=none; b=fs4dY+VgI7SvVU4/CK2rBH6Oy0nYCfvwOPEYNaxElgQVnpDs0YPtnzpvm15EyDQg3+LjcnBne5vg68mCdhI/tgT7/2/7ig4LG2VauUDgA+cvPNxL7PLHoY6JGmo1ny+k0mlbLq2mBY4Lsff2WzwO1Puhjd5UPL1r2+2/Gsx4NOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724051475; c=relaxed/simple;
	bh=WKbuxYC01id4+Ff3hENlLipWycDHQlk5MFcE7NofbCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4DENDGRQT+6oMABQvFaNgKf0ZUdVVyKKbsuR123YFyWVjLzHvTIwJ6aDdvA4nTSebkw3Nxj5nKctmzS9DAynUGME8OjqoRvAEmmlukyYZe1POA/Pfyd/m7Dl+D5ijSUM83YckULn4XomhyCEwjp7+LFigDiUbszF/7lLazHn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=dNoeHLWy; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="dNoeHLWy"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b2e6e7ad28so16563577b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724051471; x=1724656271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9nfGkovW8vcqRFWINyztR24SI6/jP26YCMtTeJhmS4=;
        b=dNoeHLWylfIKnuFR/h9tUSqRNqVUE+J32GU0sgPKkOaLykCHml7SxClI1xA2gK7C23
         5tH/U1p+o9N4msSP+qs8WYhB9jzXQCfd4m/AcWys/rP2DgBoRpMndQaziD5DOtdi5ibM
         D/1foLm5jmKvYln6TPPQwkhBE2YzfQLrYwZPfvtaGewhWaZGpRTMyc2MUbCmXoCj2oYo
         O349Ut/iiFKKnkYCEUp+lN4B9wGNTYoCMjxsfRc6j+bn5crYO/xFVqjTn8DwTrxYJ3Yl
         x7lh2gZvb/pWLBUAAX4GlqMLaUHFjwXreg5rt7WNfYr2n4RNBS4TC3R4CY0lPYs/fBMi
         c6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724051471; x=1724656271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9nfGkovW8vcqRFWINyztR24SI6/jP26YCMtTeJhmS4=;
        b=it4/5FqR9X21ePtwB+zDx6al0smCPuQpDVFWepyG9X12dymmezQauNo6UDfW/yGwrw
         P+vgo3Ai5b1+EG1aDg7Q0InT++ZBG6bHrsI5nuqlq6hPUIeyV/fuOFkvOpSv17zEA0Y8
         +5kchWttKK5LAcMVhpb/x7Q7DoBg+oZSgljVLiVvXV70CiE3/d3gh4b0DsMDAWCds5Y1
         0OWf2KfYwe7sSzK6SLgYKoUMzZNByJ9eg05dOQ0Wxp80OohoAIfMsqiiV7NcH3/otXsw
         YE/EhGJ86TZ93L8cuVEYL+Oqe+64HUe+JntRJNy/BMZvRO3Ia7/Ac1hCe/1dyHWPJFoi
         azkw==
X-Forwarded-Encrypted: i=1; AJvYcCVI4M3sSqu3CY6HXkkPdwS+wRQAJMLdWdYjL4VTdcfd1ESf3em2TpJ/J6Wx0Whpl4s6ow1F1s1jwNg80WEd5jjGPOZyuuV0vgoto2GJ0RY=
X-Gm-Message-State: AOJu0YycD85t6fq5MallEKFrGEL7R1r+syXCerM91aFTHPypzD6OuscD
	dCkaOsKE6lQl6eA/6sueDMlvAz/Kd6DJjz9l3ywhICRcxYLpwkiD5q4cQ5Aj9EYZ6NrYHg5t9uV
	YZ4/zybAzAIm15t+HGmJh1y2YHUv7szd4VTwizQ==
X-Google-Smtp-Source: AGHT+IG52YRlkwO/sYk9tM3S6bbGgs2DWnHbNNkAXWZpRI9/MJdElTyRawH1W5AXAOmY259nCFiM1hCCpj/ccvV5BNo=
X-Received: by 2002:a05:690c:7007:b0:627:7f2a:3b0d with SMTP id
 00721157ae682-6af1cf61e4amr101407107b3.14.1724051471094; Mon, 19 Aug 2024
 00:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com> <20240819005345.84255-3-fujita.tomonori@gmail.com>
In-Reply-To: <20240819005345.84255-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 02:10:59 -0500
Message-ID: <CALNs47tnxcV9-azZPjwQkFoHSnTC8TMYmHt3kPqWWG5q87+JSg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/6] rust: net::phy support probe callback
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 8:00=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Support phy_driver probe callback, used to set up device-specific
> structures.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
