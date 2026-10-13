Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6387283142
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895472; cv=pass; b=W61oWNuG9kcgZuWojnWJdy0vtKz0XXnna1CrJ01CJR4cunjcxymu3rzEoxQrq9YGamOns3wZhN6iTOwHYmxNLRHUpqEOqxrIetIL/oqoHWhUdmF4b4PwTisYe6dwMO23uVrdxzKKdIzE/5v3xCdz+sbEpRvYGS+gNvigSy+Rmk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895472; c=relaxed/simple;
	bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQdqZw4aeorJtax+x63hMkIvM6AWu9AcWCV/EIm+ESnvr8WxiLRBhQGvaR+nRFeW3C2CIVillYxY/fjNWksNc+twbdEMoEQY9V+sy4cXPGHzbX0ZZ0hzP9vLwFzZ7x3iy2xNQoxeniKtsCJEPxdXi0Xxro9QijTev2TaPoZTzM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdQigEBV; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdQigEBV"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-150b2fbd784so139999c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895469; cv=none;
        d=google.com; s=arc-20260327;
        b=AOTS2puiCME7fov1wjPusk5IiRRLpnYOjOnBdMMkTxOoQuSFtmKLewCP/kL9LKAYrM
         YiV07fxccW1cSKVbaPA8yGeUkNy0f3RjkfXGHRQmOeXXEr5ZTOKZ0uszMBDu6QiUx44X
         ybRR0qKAAd1DICjQn7NxcdbQJETs3YblotptmBOVvQZG/nJ12t12BkwjY8qXpKBSHE2+
         ddRnceclEiFpJk89/oNPGTySkXiO6lDR88VRF5JzZjlS7GanuyiqIOWU51iAffRZlzEJ
         MkrBLfm4BKDB/YeYehnorOYlimH8SKJ5pYBBnhJ+CZAVkArcusV61VSVW1OJurzcJxXy
         sMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        fh=2+qBLYArkIZPh2Ez/OL34UEyjYUot5iDGX58OHG2wOI=;
        b=AAFkN7hwK59Ksjb2aHy8uUrgQNetZdIpaXo2YY0ycgYy1V5tn0M9VQLG+EQwQkBSW+
         vNEdUg/3vU1bFAweL0q31wXTPpN6qbiuQXPLKohaZlj6B/vIKvUB/MWg+atEYkJTL7wP
         SKSMY+/y++WyAMYm/uv5LXBVgWmJxzOoS9q/LjwXuttlwQPzD+dPPm0NicYXG0TVV4Yt
         wYrfyzy3oLW7thcxos1k6+VJYRA4khp3hNkQMIRkZWvFvTWzn9ytX2C7q42tB7EtuzKz
         kkbEN+5R0CFnKe5wymWN0Lwb5otxQ81CDq7OxVf+/ROXjqdsxTCfaLsWTV36mVRDTWa5
         I9OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895469; x=1792500269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        b=SdQigEBVG3gsnV20LSBx7Dt4PpvJmaCtdTCwIjyXjyJEpUekMLib6yx4Zs+sQfkGAW
         tJtttOq375cZ7Cv1yRvcHyCUFqOkxNIXVp5cGy4eBc1RSG5+PumUK5+o293xEmg/xcSo
         iucF2PSamQQmufr3vavzZVzsM28i+O5YzKaUJAJmtQasJ7Cwtv6yQGpB65rZTiiH8wXd
         6+zTGWzxaqt/2GtFcZm2gAjZw3QM82J4//zkkhm90ZlpcMFVo9xxhzGx8Y2ExO2Hf/c1
         i3ssJajiFwD49uwi6McCX0Hr/A6Cmopo4qJLPK86YZVwMtj3M8VSX1BTswNbVd3gYxq6
         BxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895469; x=1792500269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        b=eqynPACt0mXBMHsEXpxXq3G5W7+iGoEOQobbUUPvitRfb6k4RiGPDbHOp9Z4FEVIVZ
         3DLeNZ92pjVjDFu1MgeE8XocoPS909SiRWj9iCOD4yYhyySX69oXLNSHkMLwg3qvWqKu
         8W2rTlLcFvJTVhQaBEJrdoWj4konvXjh6eoZ7v5ovDai3CTU8X/RlaUCXMIrdMvFnmAq
         2hsggixDejpQ0tLZ1NWN6w2xsN+YZ3GOnqA97209DQ0z8MXxZLdxrXbvAYltlfdnFv5Q
         WiviFoHRkEU8TE+J5AA8HuaJZb5uGKOHQPzymmRLmJJnsfRm7abX73iUrlozIV6tgU0B
         4VqA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0yESX8jsK4Ew30ows8BN5qmdmMk/SgYotSIJlyKd3Y2BbWgBeCDyTQPzJc1aflSzjqFWoa7A7m88o14n1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjoGffcn7jc2PWx+UosSar8V2jH6DxaikHCWG3+8naVyFrX0RX
	Y9mzkMMd+W4sRjc0qdg8mD4IATVZJKHwSgwYmmHUa48Y5O8+CitHNF+YvdKpAZ8eQ1QulpywPA1
	v8xuhH+vsN2wVYok8opK0s0X7d9D7+9o=
X-Gm-Gg: AYBFou09ZautrX7Do2dxBve/a1Widck2jvnRBHCYGhlDITmpG+WZRQJ6wZH4fiZTk1O
	1CVYUR5AT5E6n5gSAc5sKVAq7o+LHqcLFv71uY6pobUya2lCQlB+CvHiMQJxZ6fyOK4Ccd7DpH7
	13qV3BpwchDZMI8rTfuI/k2HAA7Bhw+ysV/V8xxCIKNw+VrE2t5o0DaGPY6YQcDCH4UWo8Ye1CM
	nf0L3aWIq2kRbeseEAkt6VPx7nMSTwVaMHvqMVoM+h3/NZdfDSnWLu3mdR2RZXv9NGF+CE2Sd+l
	E1SMus9J20LQBUu1WVWRqROZa52U2G9viL+6HiyogpBvrCIwxnSM5XNosnI6Dm+7uFeDDKCfjzg
	VlhjDaQ951HojxfyG76k2VjaE/TXtD5CYFkdwp6BzxtEKC9TZDR/cKREAYONfmjaQ9IcDv9EtyL
	J6joFhzEPeLCjvR+APnYobrBVMwxIHDNp+OkfplhLEcf0EbZzziUF7CZb/ivsoCQ==
X-Received: by 2002:a05:701b:4515:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-16a4e2f6033mr25321390c88.0.1791895468496; Tue, 13 Oct 2026
 05:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
 <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 14:44:13 +0200
X-Gm-Features: AclHuK9BCT2j2yMCpeZmg1z4Lfq84BK59tzr4n_wHbwb_FqttuaC0SVmRy_niRs
Message-ID: <CANiq72mfVY7a9+GyHsO_MWXiXhjS-Nj7ki54HJrMCqnQ-RgOmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: error: implement ZeroableOption for Error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Rust Binder wants to store an Option<Error> in TransactionInfo, which
> derives Zeroable. Implement ZeroableOption for Error so that
> Option<Error> implements Zeroable.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Greg: if you don't plan to pick this series this cycle, then I am
happy to pick this one (#1) this cycle if that helps.

Cheers,
Miguel
