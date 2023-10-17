Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE5381D8
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPdPc39A"
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB98EFB
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 02:27:26 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7dd65052aso74432127b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534846; x=1698139646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO1E5djeoEVg7NGtav7RLT/pGPNpbPUtiLNdE44wwl4=;
        b=LPdPc39Aw5zvwivOViWXrtRsBM5uLMqxHOSv3YWLW4KpOnMZ/Up0TEwjS/V9nrZQjh
         mTOfWfw1sq4moQAmjvmck7kzAxGNxFDdzUYuQiz1IVww2PppKxWRjiSsKoMmRKxNzR+Z
         4HBFHed7G5Z9d98niXq2CxTH9Z5KZZLiX8rKbtWVVpExOMv5KVaAOHTHe1XzcBq/PDU2
         YSDCzO60r29zLrFpOZd50jyu3oYEu4tMwiNP7fnJ1l1k4nBP96c+n06LKKJ+tIjMJXqr
         UXVtOsJLh41rCaryiuM+EJsBSLHPG6ECLdAmKGDh12HQtj37/vaMD4X9495AGdKdgdxe
         Ys0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534846; x=1698139646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO1E5djeoEVg7NGtav7RLT/pGPNpbPUtiLNdE44wwl4=;
        b=XsG5HboQhghjSqHymnTno+IGnQERQ03Hc41S4kEwsxOKEmTqCFy25RpUupVHZqz4Gy
         4gIhDXdxRdCsAgwgNXFz/CNAZRrvz1rMHgkHIH/S5VvLiW4gWqBPtkctkNZ7iNVd384d
         QxlvZWMBv87uM6sEKYRYaVttl62hnpr0CZC9EpxyASsY9uqtIv+YbpbBZrYi76a4hKct
         k9Q9w5N1uBFKIMhmkxtHJiqJKsm6LxN+WQfE7rTNOIzOpNAn5UyoZnlfImQOVAFkZ3o3
         6RFjdaXFmsCixUtQKlKieB+7PmLZG0BxH56/JvsRpLjWdsbzMv9F5AUbb0oKalMiVOpJ
         TieA==
X-Gm-Message-State: AOJu0YyLaqzTavbblY9F6HJWb7lE5aX3f8Zl9jT5mVXWOt7g29N93Ms5
	TtcpvjTsGlihBVxMqpxCaBNCT+yjnUCke9oca/Y=
X-Google-Smtp-Source: AGHT+IGNeViFPhZvkUazo8/Yc2FsPn44vCt4bvU8dy702OVoshGE9mwMrOaPfIiHhiIlv5K8zfJNWQA9IISs9xVvLls=
X-Received: by 2002:a81:4887:0:b0:5a1:d4f7:8b65 with SMTP id
 v129-20020a814887000000b005a1d4f78b65mr1569432ywa.27.1697534845870; Tue, 17
 Oct 2023 02:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com> <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Oct 2023 11:27:14 +0200
Message-ID: <CANiq72npq0AJwQfGUBoq9kzV5mm8ujSK-CTcCpxmQQjtEyA_Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 3:16=E2=80=AFPM Jamie Cunliffe <Jamie.Cunliffe@arm.=
com> wrote:
>
>  BINDGEN_TARGET_x86     :=3D x86_64-linux-gnu
> +BINDGEN_TARGET_arm64    :=3D aarch64-linux-gnu

Tabs vs. spaces.

>  filechk_rust_target =3D $< < include/config/auto.conf
> -

Spurious removal?

Cheers,
Miguel
