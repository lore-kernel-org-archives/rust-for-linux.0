Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F332572E
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081166; cv=none; b=S/MerLx/4wSYNFtnZMbsS+7CxtV0NF0U3WW2mZc/Blu6AEypbOZEoUh+nKw9kenSfO4WrRs7lhoRq1TIxQ5wVc8MVUGv0XvUKRLUiPbvX2cPTp6MIAjPatKZASEE4bqvuaQWNs2cHkHKGTrjAZFyBsapb1YugXxkDrDmg8vZ/8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081166; c=relaxed/simple;
	bh=MyKQZuUVRljA0Vy5XIokiNuBe4oZKVcM8DyTCGepilw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tdt0oC+FxIr1zuCR5oiHuadGwQ3WbtbbdFv8vZrMwsbXMLOHLIV9v1BF2OiGpHE4ZK40SZm1hYotd76MdPJXtJwOsXR5zRierMjqOf/CYJ3KWjBZyK2y70pmv90TkHQjBaN7JnfJjB0atBXMPt/QkTypmkvDEEZ2hQlN2nmp+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQPtQQCB; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQPtQQCB"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45085a4ab72so2559309b6e.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764081164; x=1764685964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyKQZuUVRljA0Vy5XIokiNuBe4oZKVcM8DyTCGepilw=;
        b=IQPtQQCBz/89Y2qPENf+nco4hgLTbgNnEGbF/74QR+lFDlQ2WIi9GYU+YgGLU0KUrZ
         czTmXE0xDN/JDRSuDRXWo1n42TzV0BS73aGg+wnHVkbAHyLUvbEMRfmjtM5vSBYXw7lv
         v1DwHCLl0GU6dOey0Q/cbFJvK+4oVHOhkyq2pI+4TVOVul4ecjaNGMrJhq1HuJXJU/Sa
         3A8HHkdCnBLzxTknP/2UCzoXK0HcdcZm79c+VOS1fb9UIb2VwE+w1BuTcJRxmNK4jn+W
         ZS+UMapPTVvyxrcws4zQiNoVsTLg4pI5/bZ93CPx0jX/f+ro+jqUQf/dOcWAhTF+iOqM
         PIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081164; x=1764685964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MyKQZuUVRljA0Vy5XIokiNuBe4oZKVcM8DyTCGepilw=;
        b=Oz9WgVI3lkdqEMzXD841XDIAL2hLS1Elo7g7NN+SPE/S+l2GZsIWzBI9TaES51JnN6
         xdO+2+30TkvPUSl53ou/X55NZHOTv1LYtufxh7riiwZeN1z3XZiVRSkdU/WbiQHLAb7G
         4pGnEIpCimJVfFw7DqD2ZOe177h+B54RWIglLt1hfiQzawbn7Eb6Pk4tEzwxuTIKOeqe
         zFzsziEZBmjDoTkZv61vM4tyR4wjYNVheVDw7ObtADh0mVxvSYE4lmNX90iK2myN+JYQ
         5PR4PpQQ51+6Hbwop2VNJL1rACZ4fd8k226/sBoOUPihUhlzbRGXReoWWlDOe3cUPULK
         OPkA==
X-Forwarded-Encrypted: i=1; AJvYcCXB4L2ZUcHniGiNan3gOQ69KqrTJ7fuXM6F/dC+u8SrVabbodCVVeJGqS9ZezXPqrdPzv7D9Qxk0qnLfLpD6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKGz9FcwedBBa0L9fztjAtxdFx4sfoyVZEgLF+dtfHMEPkscr
	ECmJlgtO77sadL2AOSdpkhDUIDHjoUchlt1v8VwnEmqzrh2ZLBMFxiNuuUK/wCNwzwQsmw89SdV
	amqdchmr45xaR5MLDrCiMXcynpLR2oqzjy6R/Om4F
X-Gm-Gg: ASbGncsMhPVo0c+/dMzDxSHmVKRW8ON5O9P1piIrL3EMJBQMPfiSZYtjk6YmeSudCHW
	vHco1RFizeVxr/v3b1VIL+JQy2ZDmHS58MQE+xmDc11brFAu4RGLPFMwRHv0knx0HAYDP/aq+Aw
	D/T4c0/Coh75DITD7eYoOeL+dEEVLdknKAF9TnUIgxUu0W0Wvp4sdT9zsQD73QByfi8Q+nNZIA8
	wVSkUIpk9HmF9m1QHqtOiNFpIR25hEWrIytI54+ZiSgLAvkwF+h4KkK2DKuoQKC/jlDwVRD4w7/
	vuy7Yf07DNwptShdkRLrfTJQvg==
X-Google-Smtp-Source: AGHT+IHjvptU6zNwcolgZLsz3+/2TOD65Oa5WI4jjRObP55wcByvk84HpPgVXtS9YlLvMpZ49eEU1de+E2zhBAnnvSc=
X-Received: by 2002:a05:6808:3448:b0:450:4628:e3f2 with SMTP id
 5614622812f47-4514e7a4293mr1285540b6e.42.1764081163919; Tue, 25 Nov 2025
 06:32:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com> <20251125-binder-bitmap-v6-1-dedaf1d05a98@google.com>
In-Reply-To: <20251125-binder-bitmap-v6-1-dedaf1d05a98@google.com>
From: Burak Emir <bqe@google.com>
Date: Tue, 25 Nov 2025 15:32:31 +0100
X-Gm-Features: AWmQ_bmLHlNgou_KAQoTjT3z0Cbhrcj_DZa8rVuxLSeG9BXOX_tGcMP7-BFKeEY
Message-ID: <CACQBu=VBf0KzP9mjYVFFbzGcwfPCciUtY93tajzsNa19Trn3Rg@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] rust: bitmap: add MAX_LEN and MAX_INLINE_LEN constants
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 2:59=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To avoid hard-coding these values in drivers, define constants for them
> that drivers can reference. Also, update all instances in bitmap.rs and
> id_pool.rs that use these values to use the new constants.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Burak Emir <bqe@google.com>
