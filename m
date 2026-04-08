Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032634FF59
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658711; cv=pass; b=TKGCBmCpY9M0oyIO2fnWTOykn4LL7IkLXlY3VvzWB/o3AGw7AIAPiCA3WGVK2jKOOCWMekrc7YEu0DKEnOTwpQmMwu9XqZ1b3Wvand7FQWWgeGtqmfMDVGY92eTWozBfO3NQiAhmTBodBsWzIDr/jbC98DSglUbVkmoV739lsm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658711; c=relaxed/simple;
	bh=TQBsLmh3rgmOUhdZGxCwn27jDO2LbVyXuzSkdOqA+DQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUZGcWvI/5ofxDSevlBPSzaea2yBm4ro/djD5aRNwlndHVoExVthTVf9hPrGRqegU5tiKpNNLxfDj0jPE7s6KSaWKp6fsQF9ByFMWu7pXSol9AJ/eilpVBqYdZ+h1cLCDqgTWe0wDOhaSyIEx3iwaOvwrZN/U1pv5w7Snk7UbWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFnm3kHg; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFnm3kHg"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so530759eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775658709; cv=none;
        d=google.com; s=arc-20240605;
        b=a9KVGqrqF4S6ihi0lqj+SatYklM6G5+nAKPtUYoJXD52ezRL+ABSsEWZkjW52y1Kmk
         SjUInuYZ04ra8VHXVJcGZ3rRyUNeNCa/AXXbMGVIPgSh7EQUDRDheHUoqvyTfhWgL5Gd
         JX/TVcFVSvuevsHebWvoBtnmyuGExowIPXbnP9t4eS3VXEfisduY/O9y2/nbDLpnUk3h
         cIQfem21uVo9IZEJi6tv/o8QI5IeTLV+vPh+0jJrASt3TgvrpJ9I7AHbCfnwSxFo8NNm
         rQcRWp3THIkYljHk3cZ+2kR1T6xmK1Tyx3doIy6l0y0OMs8Fmf8dikKAcrFHkg++dEDm
         0nKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQBsLmh3rgmOUhdZGxCwn27jDO2LbVyXuzSkdOqA+DQ=;
        fh=tEWW0Eh07jN9NBioSxHqBeHy/l/D0IZD+S2H6xqfBQQ=;
        b=esmL2XfoQxcF8T/gi4raks3ZEt7OushpigSjWPdVsNPhNTVJCfoWzz5OXPzyD40Hxf
         KImPXa8Yp/O7BIyImXeOuFJ78Hq0z0I6Iv3s7Jbqrcgr9esi/Vn21JB8oYZqE+qkLWZd
         pBG6sJM1YODy5/w5CxUKEvlS90F6SR3CvrQ7vDLXlirrphZcg/xmljrFlnkea5h4TH28
         F9iwR1wlEOa2H9brfUTNBYzTQgf8Q9CPv4anatbnIJHRz+DUUjNb6hbxUZjQSKUFfWHe
         oxW/VvQ64zcuFlNrbWoOAv2Dkg+yIOITDDTHs4omv2IJaC+l2gHQGvyerRcxcup7Qvaw
         N6oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775658709; x=1776263509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQBsLmh3rgmOUhdZGxCwn27jDO2LbVyXuzSkdOqA+DQ=;
        b=RFnm3kHg50Vd+hZn/CvJzhszYSTzv5NOB5a098YAx0/D9mvNVp1JONuKX2HNutS070
         A+BlHxegwW+i2brc9l78SIinEz0ErU0seyjTaLOcQm+D5IJswqtKnxahuypb3Ixu6Tqd
         86q4kAC8W/qFdkDmlfPrJUKipt+LNM+hiwgTCA7Tr2BwLhYAtMuzxgKie+zyVsu6zo4y
         NTjdPTfxRPyVYVlieXoaNjP5ozAqu98nEOGBDM+lmNgjTJ+SByj/zVx+7ubZdsRe/H7/
         rgPI+lu8gTK88g8dpUwuYI9LcKsi3gLSHKTGHBmYZIB7RfpEUiKTAcqYY+almEsid/Dy
         hcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658709; x=1776263509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQBsLmh3rgmOUhdZGxCwn27jDO2LbVyXuzSkdOqA+DQ=;
        b=XFnZTxABu6yUGoeKbjWD9ZgGRt0srCv3sQy2VLOwbRmlwILgrKCZuBALi2T+3iJk1Q
         fZ1ZukJgzgyPwCBuLazAFD79Nj8iVs3whYrwmKMKVZwFBkN8wZCXcr9+5wEr8foWHy//
         vVeI9KV2ExIOFMy/ccwbdcAArfVmMqFIzPt/E7yAtclxSGBlQu8yUCv0ssbhmrts4vTg
         qVb3D6jOk+x6yxo/svEy+Rmt+Qo8PxCpc+ugGiOFgdDRM+iFKuoiLU1VQBzyHkyu4CfH
         T2Y796fZVR9+torc6e+4IVNTXPItcCG9dxId5inLRPXjjr1LVsL2cMg28JIgmmydPpPG
         nB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqxw4HqC3G7/eikjnBbafCeeFFh7xTJhqhqZWuuh46eMieVz36A0q91FgyTkqNNaOAXHz05+wifCyordFSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNRVGjHTDUCAwJn3mTOWPfIel6HjxYI0exCaa4SUvSWU9gERe2
	28FVzYZZXxceqGhyN5+PepUnQBEiUW9hwk4P69g68T7KeWZUpwB/UzAJoqfeRrCrAHmooNfrEBE
	dFAXY+L3hjqD2qLkR5M7nEd3FunuCy5A=
X-Gm-Gg: AeBDiesYseJEXkrq1/W0oPKaMj3XdWYuWiq6fPLrh6S/RskITi4XdipQ6DOy3xWDOrz
	68vGvmUzE0NV4CwNCSQzY4OBhYuKu4BdK5z++FY5buv+L7eQjHBOtw4PiVftqYX5dc3gT7kUw0l
	OHhiowJ8NFhw9vI9p3ozXqGa6N1LQdATcWRh5pj2A3CIX/aWb/QLb+Lbf33ULyy3vJX4JyV4yA7
	dmmUDJXJgpTOGqe4QepZbb32vojo/ZR8wyBjIE/Hv/uekfW4k+0vUeb/9MSOiMQMilW3fK9U2i4
	WwwmeiiwJEj9GlWlkZAoMRbCEKbWK0PWyyD6UPNfEUttju8YEMIL/Q8Iezep34ikxjwVsqzsPmT
	BzLGUnhuY0NBDLnet+SoFdJw=
X-Received: by 2002:a05:7300:a484:b0:2c7:2cac:814c with SMTP id
 5a478bee46e88-2cbfc16e687mr3714292eec.3.1775658708837; Wed, 08 Apr 2026
 07:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408140007.8401-1-sidong.yang@furiosa.ai> <20260408140007.8401-2-sidong.yang@furiosa.ai>
In-Reply-To: <20260408140007.8401-2-sidong.yang@furiosa.ai>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 16:31:35 +0200
X-Gm-Features: AQROBzAf-kiI8Xxr0IXJpWmj_aQGbOJ9Psm4chEl2_TiG3P4EQCU4R8zrRcOQt4
Message-ID: <CANiq72n2h5Vj4-_wfPWXf9HO9UouaKtVKmoTGQeE-g+N-MYUPA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] rust: bindings: add io_uring headers in bindings_helper.h
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Caleb Sander Mateos <csander@purestorage.com>, Benno Lossin <lossin@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 4:00=E2=80=AFPM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> This patch adds two headers io_uring.h io_uring/cmd.h in bindings_helper
> for implementing rust io_uring abstraction.
>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>

If there is a reason for putting it at the bottom, then please note it
in the commit message.

Thanks!

Cheers,
Miguel
