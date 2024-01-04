Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8622305
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pPNTgmuv"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4b7b28211beso167410e0c.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 05:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704376249; x=1704981049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wUYo80fdR4FT/SVGApfPe7pPXOeeF8oJCKGkhPUBQ4=;
        b=pPNTgmuvqRFHRfmrinDT6Kmu+XYHwzjLKYwlsZZptz7nSrUtv5ATlLI1RzdC6g3xYo
         caZYZlx2ZSBg4ubL27Gj32ylh+6K+Glqn14M6IgzMEIDX4+BPJEbFRMs0neQTDkSnczk
         qJ56GpohpM3zta5EY1x1q+w8dhaQFkNmiaOzyBR1BZNCpewmsB6uk3c3jqc6C+IS2CiK
         l01HelmzLuh4EgjBBWnSf53rYAhSwGGSsIV4/3AcJnENMWcH+E/nwA/N9w7SDCQzPYfl
         3TPJx4uo4aM1n38KWwUI/CElNQQzUy6x8Gay5Rm/usWxBVfFneY2TpJVqtaNHwFSJ/oA
         xAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376249; x=1704981049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wUYo80fdR4FT/SVGApfPe7pPXOeeF8oJCKGkhPUBQ4=;
        b=ayKiMxou+R14g4uDAV0BtXW/oC6dr6BjYiPlbBrfJLTPXacqdF0o8fX6NzP5r9mJTw
         XGHixllgda1HHBHXvy2q/c3tR3D2YrNjRiMpWOUU8a8p4XRkS6RXJSC+N99tfa0STMLn
         x9kkMnSVB5ujYYQRyq2Vv3ZO6FdZDlO+MiFWKIEMjobFFHver1KmOoa//Qmtu1IetK/h
         j8vjrWoOBR7daYsz5O51Xi8L+pVKjp0kTIVkfiHkjuyLz/HpKraRsiyfn17m6EFKzmra
         9O3Be1BCoLUpumtT5LcHoQyOJ0vs7NMceCqDMn8Fh9PoQCLiKrwB9RUhXhEbCxT/cdWv
         y4LA==
X-Gm-Message-State: AOJu0YyOSGffUBHCjGk9gZCdYAF30j8WLr3Hi+qSXn0lVb4iV+Rspx6k
	jS9ZjfRQECpUPLMfIoQsebyilW6nnyLNYs3NMSyekJCkjesg
X-Google-Smtp-Source: AGHT+IHA/5q3b8vhSx+o+mjSaAttqwGmWpFeQFH52jhXWq3ovLs5SXl+BPsqqepe9tmMzqZ3U02Yht1it0woe5HbOCo=
X-Received: by 2002:a05:6122:30a1:b0:4b7:a77c:d133 with SMTP id
 cd33-20020a05612230a100b004b7a77cd133mr538092vkb.11.1704376248694; Thu, 04
 Jan 2024 05:50:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216-rb-new-condvar-methods-v2-0-b05ab61e6d5b@google.com>
 <20231216-rb-new-condvar-methods-v2-4-b05ab61e6d5b@google.com> <76415f1d-174c-4cee-9b58-e956be6bda54@gmail.com>
In-Reply-To: <76415f1d-174c-4cee-9b58-e956be6bda54@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 14:50:37 +0100
Message-ID: <CAH5fLgjdk+e419Zir4q59pApeY1XpDWf7m+AC=wUXkNwSkXN-Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: sync: update integer types in CondVar
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 5:42=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
> On 12/16/23 12:31, Alice Ryhl wrote:
> >       /// Calls the kernel function to notify the appropriate number of=
 threads with the given flags.
>
> There are no more flags, please update the comment.

Nice catch! Fixed.

Alice
