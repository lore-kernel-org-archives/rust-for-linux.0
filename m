Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C73F9E7
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 17:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549218; cv=none; b=V1xUs9hGIkd477qQetXs3HBfbVZDnTBncCG2Sly/XGIqOEkZo/0iGa9W7hif/6x4kfE1D4m5OvKtTRuCjLO2vpsuqjNPiBd/UE+KUNZmKJJH7euKymIxU+saF3OQXaFPJf1k9IpDyjlVulGls+urBsE6YfO54VIUKVnA31JbuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549218; c=relaxed/simple;
	bh=sG9diK3jTkTCpLqPyV7jCMJ5Q0z+9X2BNsBwiWphb28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=riXKCUGlX5tuueY2tT/x/0EZE9K2Gj9F9X7ozUrtPPSKllgW9PMzO9V13lV/fHxLR468v2osB3pvJ3n8IiCFXwVMR3dXC40wo0xHJt6XmlVPyi7J5TGCBAaSdQkYAt3vUi0T182RmGONGau5/cNUwdlvW7oAlYlvS0Zs7XgeoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg/WSyf+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg/WSyf+"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6039716f285so21684077b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706549216; x=1707154016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sG9diK3jTkTCpLqPyV7jCMJ5Q0z+9X2BNsBwiWphb28=;
        b=jg/WSyf++SZ95Lz6aZUwN7pkjGPea4jgsGdgHfohuqbB8dGyJ1c5If9VBqBAa3uVN5
         c2/9vjPs9TpxbQ2G9WJI/+FaqTI0OwfCmb8/rJS7T3DXvVg7Gy379Lcws36z8r1x/qgk
         ZeK6epaokE0XzkUt+L0qHmYtZ475zDpSWKCJv2PJFZ3vz+FISmuBMw2KBNJQzD7ximxT
         P039H8Y6G/06Sw9pVGaKtf3274VYilrySIM26AA1JPKUSlLYWmkbJG1PHd9R8MeBE8OK
         iuD6WK14wColzz8av4Y0GiI6obUC9DScumMDXvDrjSajl15iwJ9BEuzwtRHkYiFYpdbw
         EzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549216; x=1707154016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sG9diK3jTkTCpLqPyV7jCMJ5Q0z+9X2BNsBwiWphb28=;
        b=oRX0Hp5PzOjmR4PZVCcJv9tkvJ5LPjnhVbVqOeJEIilMOZhRJG2ME6KuBwpX7cUHaR
         qStPeXEIsXK2N5+fVX62UAR+hH55OBkr1IOSEKeFrig1V7OEc4NMX/gUMxM3j4Xp3O14
         s921TE7ezupSi6myIC/+H+aXeNDfNxBoPf93c9UxYoOGXGP+1QuCOvY3ZTcyHa/JZI/f
         dc7luNdBhlTl0WGiIDsXR2UIUyDP+f7gwmNmov3VQ5DP+eTsAFfjWv8MAblk1QkqyDCE
         kV93J8xi7dnnk9ZInH1SklfTVBqaAFUt0+fFmc0Z/DYfKw8uBlAvsQtzP92RomLFHRJC
         VESA==
X-Gm-Message-State: AOJu0YxFMh/ycgmIJ1/+/jqSSp7Oo7dC68yHwx1cK2gWNQi8kqECXrfq
	F5yaRFw57PSVXHm/LPut8Gi+xMt37J41hCiA7Nhzlh5fmhLVt1jTXb+aIffuPtiR8/PE6Otaqog
	N818SB0+J6bNNY6IaYMoIYNfHfy4=
X-Google-Smtp-Source: AGHT+IEcRMQfsiKBIv8izl8himvT9MpZdy0R6sHB58fh5vRPpb5DSJBaZtebman+IfJ1YioEJgK7/iXhVyFmGIItG5U=
X-Received: by 2002:a05:690c:a16:b0:5ff:6edc:dc2 with SMTP id
 cg22-20020a05690c0a1600b005ff6edc0dc2mr5192208ywb.72.1706549216300; Mon, 29
 Jan 2024 09:26:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
 <CAH5fLggMYqR2_WKOZwp0caMMOHgb2s8S1zY2FkUWrRsHGjJ2Dg@mail.gmail.com>
In-Reply-To: <CAH5fLggMYqR2_WKOZwp0caMMOHgb2s8S1zY2FkUWrRsHGjJ2Dg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jan 2024 18:26:45 +0100
Message-ID: <CANiq72mH0RSKL18ZGorqLnGX=rkrMMiMT7dqPP1HA26Kuc7-_A@mail.gmail.com>
Subject: Re: linux-next: workqueue + rust build fix
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Looks good to me, thanks for catching that Miguel.

You're welcome! I appreciate the double-check.

Cheers,
Miguel
