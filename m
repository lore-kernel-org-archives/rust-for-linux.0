Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA0393DDC
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983451; cv=pass; b=E21q5soRDb5bj2/KldeiGSUJEPhrGRI2npCgoSjzs0GEw8yX8KVUgRJytNOf/90Ur8v64nCPrAeh2Vh0Ashwr3vtXZMs7sInmdVQVuKdKlfKfdw7MVOctXZsDWFCJ6TVmz2LnGjSRf0JsDGiX+eaqnLGbUmCzpMPom2zf0Vu3/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983451; c=relaxed/simple;
	bh=4ydJKBzXl8vGu/qhevLAEpZeV8I3Agpri6WPhn0p5Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue6i4FMiFKrzLtpob27Bzo1c+KE2l71/LVJYGLpjQtLXf4zUT5XlNTY3aHCXV+saoOjGITqiskqRUU2/MuCvfteiSlaJJ1blcWxyZWlgtbzb8Zu2DaWh/MO0B8RTWgWQVdmT3ip4M/fvqOsvMRuO5YPGYZsNaSO7k7/DfXG6Jvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5tTs+jZ; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5tTs+jZ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12dc1c0b724so472602c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 05:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777983449; cv=none;
        d=google.com; s=arc-20240605;
        b=F/pTZiGnm2Smqb4+M5RV2+f550JP+gan139fbxYsxTzvpcRQvBwuECWsgnlP2CgFEZ
         vS43m1xqJPum1vLjDO2wzkgemd9TRMJBTwQJYsjViyA9tML4sURSgwZ7ul12MeFvaEOA
         puTmcDqg6GTHxKev/UHsBqKoi/4MMvopkvf8Xndbx9Aza5b/JMYjB4WwvJW9yVA1VHaX
         5NFriENLpT6ILlWGOHJqRbkdMOAtGDBR59iKmxN3qz9t3+g+RAOFAAtlLHw+Ne+yNJDP
         d4wIRBUfV42PqnNDEad4Vf9nfYb8tQLspnJsx3Hcju3cQVfoBGAUKztf1/6K0NlobY0X
         FvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        fh=MQkMqupknArtDNkBalqnqGgdaiqMm+LR6mpQl2ai2Vg=;
        b=dByoHN99GzjnHvZ68uNbG5rxiPXfzgA83jB58Muf/5m/inQ8ZkotrNDDoh98dc3Ua+
         Vw2bpbSl95BPwAlLsi6KQoI7dOi1QtCK6P8IID5XqqmP/tVfZjdaR5vtC7fYJFuGW4Nh
         2b+X67fDExm70KbU87v09w/xdwq76GmwJYa6kqU1P0BCa8Jyn9E1LVUVvJrm1md6fRFz
         mFgKeUU4WYLXp63UEl3ZVeCq+zRWvZnUOQ5KBQJLd+xyQAvASJnuAxR5ONsZuCBuPh9D
         B2sAxPtvY3JGMcc7fKhMCrjGC0DzIn9sLjqgQxUbTwxFXDCU6cJ/PqDm7HMoGa5ow5e/
         vPCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983449; x=1778588249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=E5tTs+jZMVO3FGq/nQKWoHooKTeVhj0VV05okaMc3Iv/Hl4qs4KIeOjITpB2n0HT5C
         ofA5qRrB5dVLPWQ/T02kaZP7/S7OyhaWNhATfmZO9+LwpGHqc7wR2tgSaz++qr4JuAUn
         jL1EWImb+tNowkpUS66BgtengZjIY0BTPClPBli8ebzqbcRmgBF4Oib8BzStOrC/VSd9
         +VbRD1mXYE1jF4hd52Obph42jHKU3l8MyhaAJ/lZCyO1JJqPhcFBbX1y3CzPmuoJ6ImU
         6nhpxu2IMTxkUHDaKTl7Xm14NvJg4T9KvrMNvcZo97+1qm8fMUbs9oIjJEBmEZhMcaSH
         LbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983449; x=1778588249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=XJ1q10vCRJan9dQO5iXYgu+RJsm6W1+vwEc6UCYSqGhLTh2yrmZT8aHrd/fAi2o4fO
         dahjZufkqAkq+P6HjXsc0oHkGeoE3fu0M1TlltY7BJw9glMsyEyUL6XA2AEjAS/Mmxne
         N1sJHzbdOses6+c3i8tybeSJi8A9LDHctZ0aVDTnxEIjGXZBZfMFV4GSDiI2uCs3nuPk
         DDG+CYrHPYPsdVyiwx7XmfwZRoz+m2oZW0LZYUAMy9MhXUp3S403da3l6648n/r9Dchd
         crv3dV8KaAe3jcaCXfELAqFTlEh9TEs8O10KLScEAHyVGFy5mdpShkbGcs/G+O12kcqb
         E7lA==
X-Forwarded-Encrypted: i=1; AFNElJ/i95E/rjSRASSvglBS8gJCa91mSmTls/SqChPO9IGV9fOjeXSec/Ie9GyvG6875npljKQI4ma7Z7K0yMAKEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4098OB5iNAERbJDe5oSnvMG+j4Kzlz+7vPO56DheDsJcVc7lG
	O0aToEQ2sTMw53Nhxi/39HvU3BZZDMe0QmDtmNQJgpAtrl0n1JG+14mtp7e7y2ii0nuwGXybm/+
	vItcO2IiViDOEiDT8IEV9zMLd+DAqgeE=
X-Gm-Gg: AeBDies2JFMf/P+MpFFEbc1oZxAx1C/SrLkcI+/ydXONBqwU7KYuJPSRK5RPo4tJuSb
	VcBgsmPXP4OE3Y0nqY5pMCVpnRLnyK/5GzjN76kzHbJTaoQbc/orEXoonz/HjlDe54xnZ7usCrt
	i+mbSga4RqYSA5AlScApVRGYWICZsqeOWmlbkhmXmY3wirZG0k/c0DsCsvZwG80Ym1shgTK280Z
	SypmFV26HNBmFO2ZhsRNe1yB6jbOcE6iLOQxAcuUDswD1nSgJOJktIcv/p+6viwXFZwYrjPVz79
	nG63PKtFOgvDgXlDN2gz8Na359CIvv5OmpqTDkh00wTgILkNVzFJAgUbcdGTFQLAd5AJtQXwyuJ
	qVmB1t79f62fyjge3aIRzNjEsPkcLLmun/g==
X-Received: by 2002:a05:7300:dc04:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2f41ddff527mr617567eec.4.1777983449127; Tue, 05 May 2026
 05:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501205825.73614-1-joelagnelf@nvidia.com> <20260501205825.73614-2-joelagnelf@nvidia.com>
In-Reply-To: <20260501205825.73614-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 14:17:16 +0200
X-Gm-Features: AVHnY4IRsrOm00S5Cjdrtaixtaeoy2G18CIkU94qlj-QCX6kz6PrDy_aREt3VvQ
Message-ID: <CANiq72nW4ibDKYySiLo14B2W-PWbZv58d0a604cGQ_+A+ftBog@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] rust: sync: completion: add wait_for_completion_timeout()
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 10:58=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.

This is fine since it follows the other ones in the file, but we
should say why this is the case (in another series, possibly a good
first issue), rather than just asserting it.

e.g. a type invariant?

Cheers,
Miguel
