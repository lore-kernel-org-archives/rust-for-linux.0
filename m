Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228613AD527
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Oct 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644643; cv=pass; b=LTw4m/QhxxlUjIf3EMCtrSbbQn8HUZ8fEymrZXHjIMQjIcoJVlz96T0b3zLgGfdm0WmAU80KovJxLW6V1vtg3grkV2+Gcs/jVk/2ptgJdmYh2N5EA4L4mA9CWrbkZN6dcRDDevtYm2RY4DtG/k8Fu7ZuxUtHPS89jMiS7qmUj/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644643; c=relaxed/simple;
	bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMZccHMMSh09Q4WxiNVadEAEEAzi7Lv8BIykflYxFa0n+QZ0JI+/lOKwcq0jGVEu9TNN95z9tfCxZBQ5eTklxIJdwAVWrrqa7xAOsFH7/cYIbfL/bVpCLfm/OxltMc98pV+EjfRjOceeT27zpSYqGDIp0ezbyRtq0zKECZUxEG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWIz0/8l; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWIz0/8l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so6200105e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Oct 2026 08:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791644639; cv=none;
        d=google.com; s=arc-20260327;
        b=GLDxf27zN2aK4NbXiIlB8b6vVNYW33rtPHHwIFQMx3wOE9lU1hUqZEKoNg96L9zreg
         zxahMQDHcsHYkGeN5pMD+RzsbO+YFzL6pWMinJ9yONELEqNeCWzs7bTIFcZNKlLIkWtr
         loHKT6qCv7t4xWZnz3xyPDneAultG1syrT3jGsFH5PBX6k9nawTjyKe6rgSfytudBUHg
         cpi5Q+aBdmzZrGSsMwg59278KQooWQG7hdiRMBFVghtz6jC1uJoeKDTloM16d8pHbe7l
         bfVXDgbJDqnipSGi+knkiRZelJUtvyJC8pJ+35sJjs08ZoV9NOj4R1qNjba5r6CLCqpr
         fdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        fh=aLDP5M7raHiRdmwiYhB5qpjLi7aPYZOSujxQa14nY0Y=;
        b=QvoR6J7ziF5fJH9vpbcQjxzHQrRA8td8rSj/M7rEfqSx3hyuOrlv+jFN9JZNVCM7Q9
         x8iK8WuBJuR5U3GISOkRQEqcsOstIUWoF38uFoKCXaN9oKi/u+17iA4Mt69gLMdsD+ji
         CKUpZm5hf9FudRAZjXnA5y8U/bzAgOcla9K6l42nk5SNEANCCNnQ/uDvPu1hIUQLaMtY
         bt//2Rk47xAu2dzXnk7M0NZggN4dj/FQD+JiZwhKWbLYplD+ILlIT5baYZ2yAyPnxhD+
         6Cwrn4Wv7OnN5HGkbF7u7z7DPfwPIrl2Xw9yWoBscixhZHDDvcBgGyUYOp/pDsFnjWFP
         tnBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791644639; x=1792249439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=DWIz0/8lc4QHZ7bP3eOzEjFaaH4GQUOHsMiRqz+rn3aN9J3Qq01KkNTWWkYEz+bfgr
         pu2w2WwKff2ih1bTtBe5t7CgYGsxONJnS/R6rlzjvjgAX2yenrFZZsNr3UbheQs6qsOl
         S3EuVvnwMH16bf4kbalELFSBEkx0Jvyv7e/bYN+0ywrVzdhZPkzZnwHZJvS+6n0vqCfV
         NAEif1sBA3rEcOpXBqHSwijGUfdadtnQSNLx1wz7Lq1FT61tAMsUwYfnq9neAur4u3I9
         +Tg1yNHe3A1INCHDWfqACIpHMNWiIoR9axHsXSQekNg25CwoBqOh02okt846NdRRUp2M
         vgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644639; x=1792249439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=nFCTXwX+88hiJXlv6ieYHBXLrV/LhfyipEm7vd3qLUWcuNIbEZl8fGMnl34IAdXv3i
         xPNWzQ/oeVxrqLqgbE4Cki/xFFg+jj+53vQ5WKLeTDYBXs2PL07RxxjnWKGty2NDKYtP
         Ja79WIMrmSihP+Xsni7IZsSQ5160nbHC+YcA1vrd6RHW9p9tfj3sTXy/qqYosP6OT+pC
         YcI7c+lIWyJCxWdryqcMtBCOkaGdlOFVRyjUwSBlTyXvnnOn95iaZup+OPLOrJY6XO1m
         KwpShrAX3WZOEEtSC+bupzxy6/REolWWdMHlOPorPCtLjcIr+fdSUWlGIAFDsy1iaPri
         6uWg==
X-Forwarded-Encrypted: i=1; AKwUvBxtd+3Y8KlHNaIyS5kf1aytphjuifuGBgwXIKcbm2MSK4iZP9FaXyOeOtPUzYDlar437HiYn8TkkGr7UN5NVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdX3whftHfwzCK5dPC5GPp0Ql5KUrwobk83VriCke1HkTgURDg
	u4nLiG6C6MfgD/B45M06/rn+RAnBgUgU3V3Mxcl0aeZNeLLf2V4akCF6r8LgXkrHOeRAcINiZEe
	e905lSY0KSgxIhiy27YUVRitFHCzHBRHd3FhEdk3m
X-Gm-Gg: AYBFou3BNiMmvWLBSgVMnc4ki7IZi1Puqpw2vfZVv+UCHkapKkX4dZM+v8Sqocu31b4
	9zkyWVPXMlyCsYQtkfQIE/XoVsjA/26rBHPFoBVmDJcpYIA1iqerkW/QvSy4xJ766sS0OXb5f+r
	nO339pcH9QFAYvGESMcb5ju2V2mhnG9oUWOL8mKNy26h0WAeqK1HT0yCQ1afMuL+JIuD6FPodSb
	dPzHo3UCj0lRylxoeiZzuFgfuywyuolixijA9o1MhmcORFoeR979JqFTlks60aPUC/Zw+BS/K2W
	VrmtgT6LZ9nlgFiyC+yk/3bWmaexe0JeHpmx1kJ03WtcOzCljf3l/S9q69auhKQC45ved62iUfv
	E+5ElmOraa+vf68GzQOjz
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id
 5b1f17b1804b1-4a18e4d68aamr77276885e9.24.1791644638230; Sat, 10 Oct 2026
 08:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929190024.2248099-1-dakr@kernel.org>
In-Reply-To: <20260929190024.2248099-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Oct 2026 17:03:45 +0200
X-Gm-Features: AclHuK8ZQUI3eItwXg_rZSYr1EbwRsPHujK2QRZB7QR-TB8HYr0HF9f_x1pIk1Y
Message-ID: <CAH5fLgh6siikdQ-vM2eMdbgqxOvquGuv=0UKZwidabj4tcGV7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Convert drm::Registration to return an impl PinInit<Self, Error> rather
> than creating a separate allocation. This removes an otherwise
> unnecessary allocation.
>
> Update both in-tree callers (nova, tyr) to construct their bus device
> private data using try_pin_init!().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

For both:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
