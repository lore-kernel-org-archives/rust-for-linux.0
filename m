Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E32C0261
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853851; cv=pass; b=s1bev0EDEhHguLXw0n8X4rFfIROfHNaJTQVz++tBp6tgfFOZbjco6sHqSreX/ArunwXlkeo7l6nWJvQn3+VgkWrPzK4DFe2m065jKkj6MuRLd6pqhwdcJ1j7ZkL6jPiye8u0MFy2xY2BQJ+dgWl9cYVHs8RilUT3bPO+/7xmMJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853851; c=relaxed/simple;
	bh=5dsrgWIujQVyYPAJxjo26QszGIbfe51KgRR/xv8ZIgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnhhNryYocigzENCpnwGTtpx7D1unWptUWDj4zqGc/7kWd+VLacxqj5gDiuCAsJza/lOq0zjKqy4w/kAyPyretqHTe58bhj3pRB0SQp856kctbKyYy/E5uWkMrg97FYSNzgOm93QmkpFx68gT0H4wzD2FV8UTF+92RbiykzG5S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DO52yT5r; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DO52yT5r"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13b345dc7f7so1041c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 14:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853850; cv=none;
        d=google.com; s=arc-20260327;
        b=JOFZWgJ9BPE3efE+cIGZKZbsAddmFMcWQcZXm/osHyqVwoSFXmCnaoDRoaOZ/FVZop
         +mvnUgMcSh/l/CzcTUt3/Acgg6zRIUwFMu9O+C8hNSLR7VxGg4EZvNiFe17TpTEC9lQW
         Li7155pfKCNA+LbH9imaBSjoM1iARl3ugTMUGGwp3tfvnL68FuO10mFQULb3tHR/E0qE
         td74oloo0K9sGFzR3OgKqrOKA/FyXCjSCJVRFWCbO5Nv/wstxEKZRQN6zNTKqS1U2Flu
         g1b2NOHE+3iSXh3mgdkeCs8zyTSFNVMWcBmA04dh/fap1yUG9FHZ01Va+9Du74UBUVhB
         m57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
        fh=ipW896+8k/QzH1UNVb4LRbZT/sxycaij3F1XwJkwodM=;
        b=CIoAVcDY4ukl4NOO/ASAOH3NpkDmU4s+6b2tLsjNp3lLtvaekluLEhLxTti23+Pg63
         VzyGX/svuiuNoctquF6FG4ivn+9iLaGVE7R8B5aMLnsbvCgbI/59o4V5/CHNJFOjRDJL
         bR/3ZRcbYGvGtCZu5rlyGRepp+LAFw+/5FKNrToSMEuEKMe/kW3G3K5Pz8WhZ5eEmugV
         1Hvr9nft/ShpLSNm/JMPEafR67IEZr59dVPy7qgA9+1QK9Rkuq/YLsrhUtzpkaRGe6so
         mUeqLthU9a2Nn/XXd1WWrLwwoNINvLmtTQFw2UcaS95+x8cca9NyXEvhJPm4HskW4WW2
         CRyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853850; x=1783458650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
        b=DO52yT5ruTo36vSsGQYwQcxu3xU7jCVEOLh3LVxCo3RdgYEmOWNu9CA1vH9mprTran
         D7y49XEbZZ092ERV40w44PUTlNgqmLqogfx/9E5SQXIgIdSr/NEbus3iAvdaZSJcu9Jj
         VmbdX3ils3yreKpZ3uoJ2WJOQjpFthUt6X4VZlBrDXkPx7xC2N9kTHvqUmsvy0PvUgCj
         h14lo0WHagJ+q3KZMTNcuaLyCUjgfPngnIfvOCBnlD2d9MdCR0Y0JxvAwVdPoapDqtZu
         U+OhjJH+6+HyyDvneYxL4+OLcd3Lxs3mah7ooDvouor8ruokLe6HwKLdmH/mNE+1nm43
         P6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853850; x=1783458650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
        b=JJmrQCMn78X+OiUYHSYauugYefQcCo5uIWBuQ0Yh7Okbt+yQDCN+SAYn9tNNtwnkK2
         DtRganfoiGOkSXALLgpVzwUa7imMaF/gzsb5dsB7OUSkIpDQ3Wf8edo/lpOAv2dRKcEs
         2Ia5cFJMz4iJKFqQhWXjFZdhu4UL/dRbU/FamfiKL2zBSLxtC0GN1mbnLcSC7IGOIELH
         HaCVdKk4nDyAl/inM53Z5z/xDuHmsFMQuyHQnxIl94OxBOTOJEnESvSKsnEtYlIoMutN
         t5L/DF9As8DYVGKrpaSF7FKc3OrRyr4R8n5pRtWGZjaX6rzz2bAYUx2oFiCdM/9QKE31
         62qA==
X-Forwarded-Encrypted: i=1; AFNElJ+UAn7PQZhzvGQvJmAtDl6AWq84Jsy1t8vdaEGKJGWe0AjEaRBdcTAypuHmlhksivVujkrsDpk/rFVe+jhlcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5REipyWSFOhxQeqfHwxzRq1buhnwnUZdfnfbof3Zopjo6DJ7E
	l+og75CmNn2m1RSMAwqo6m7B56938glbf7cUNRco0zXa/9/Rd1B6VtPuxiZPKmQpYAPiYyBPVqU
	HGDkckn+9zVgxPXcGmVmyxCPJxKlCq6A=
X-Gm-Gg: AfdE7cmwVHzXOxLm7K+bNc0BAzhtCyIZBzeSdNftEEobL9lS4/ZYikB4+LrkZD7P6oq
	0DaRrctpzMEgB2KCD1yk5V2caWUNWAWj3W5Z750ZpmPIHYhqVNCc+s0h53kfYaQzZsVfpa7JhC4
	s0Anas6wThq4uW1bH9HvKuuV4IAajvNOqonWeYNN/N5EqIrPL2MqYNakdiQGImS7ZosZrfCoXqJ
	JBjfklY4nAzHvKbthB/BdcC95afEosZGPwwo+Ui7vvd0ZSonUrFwMCWJJlKtR5Vqrg43HxQkoGW
	G73b46IkouNHwpa7Nay7Jk/y+PUI79kNCPMvDRmDnnClHYHnTIdB9etCMMAa6DVnT1su7+QiGFg
	oHpL9GMV+lJ+r
X-Received: by 2002:a05:7022:688b:b0:137:e391:1ae2 with SMTP id
 a92af1059eb24-13b2a1ab955mr1757879c88.6.1782853849895; Tue, 30 Jun 2026
 14:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630210445.23103-1-breno3011alves@gmail.com>
In-Reply-To: <20260630210445.23103-1-breno3011alves@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 23:10:37 +0200
X-Gm-Features: AVVi8Cfjoi3T3EKFkCwXhsv0BrkYg3IOIGvLrRnFevnovSKeBOUhSVdqZIWPxgE
Message-ID: <CANiq72nFchJZVE8sr=oRnh8wR_DxefJNBUV=OwOs7hShZXApTQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: core: implement rx580 state optimization engine
 and c-to-rust char dev
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: alexander.deucher@amd.com, gregkh@linuxfoundation.org, ojeda@kernel.org, 
	christian.koenig@amd.com, arnd@arndb.de, rust-for-linux@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 11:04=E2=80=AFPM Breno Rodrigues Alves
<breno3011alves@gmail.com> wrote:
>
> diff --git a/Documentation/rust/alves_guidelines.rst b/Documentation/rust=
/alves_guidelines.rst
> new file mode 100644
> index 000000000..f6afa63de
> --- /dev/null
> +++ b/Documentation/rust/alves_guidelines.rst
> @@ -0,0 +1,3 @@
> +# Rust for Linux - Core Guidelines
> +- Style: Linear, pragmatic, flat, Linus Torvalds style.
> +- Constraints: Zero-cost abstractions, strict RAII, no binary bloat.

What is this? And how is it possible that you changed this file (and
also tested the typo) within minutes of v2 submission?

Is this submission generated with AI? Please see:

  https://docs.kernel.org/process/generated-content.html
  https://docs.kernel.org/process/coding-assistants.html

Please observe the ~week delay between submissions. Also please add
changelogs for your submissions etc. Please see:

  https://docs.kernel.org/process/submitting-patches.html

Thanks!

Cheers,
Miguel
