Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9CC335564
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856127; cv=pass; b=bjMThkC2ZywG3s3LX2YwXtg9BEl9Wn0uXm26AphIMNz/r46sG6OBc0txEBhQIALrAGPz63mnTBDEyrtNmpyLgP+CMULPy6D7SrGtv1Hxv8imsVBbWqg+llxaJI+6kCFsi1ed98yyyMZwuCKzFKdXET857zFP9Pjk+eAYkhbyGac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856127; c=relaxed/simple;
	bh=bEknJwd69BPqBX6M20MiEGYpWE1pn2YGl/7/sZbmkec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIqvQf6+38Ubp0b3rqSGa/R7YqQ6I8iYB5nVkB7PUAgCY8N6q0wXkM4naNrr3oGhzbh22AVK5wcHxO7RJfUdpDBH30qZBkNDkzDjvIuIVuEyxeyiSuI5kjUPMX0yVHpe2grmtlq0PqxMih9JHjPcWG3heCnSQuL4BD21+T9sFDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhjZgiei; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhjZgiei"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bbfe3aefdso85120eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 01:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856125; cv=none;
        d=google.com; s=arc-20240605;
        b=FRyk1aTv4dkybLeMmA1599W8MWWUZ3NfCYa4mSv5SfNIZ0AhecWlU3TGHX0qeuZwhe
         qptls1eMqjeovxGfzrZuMQmBSA11peH2e8zrkWwcTSBygYVwI7bLtvwusFVTqSb5cxOL
         UYKJl3676FugCDaT/ZCThItwQ8A2ng2ARwxEz+/yRbOovX54nTmxF+Tt7IIg2+ftoOwi
         8GYdPpG26Fs26YNMEO0orUcU6zBpNWjdNyJtOyXMjlUs3g33V2FHicC0u1JcLSg+T5at
         DLIUXHIvrV4L4tiOu6+63c+afgnnxYpubkCYQ/E3hjBbI5cpJLW1vf0iDDL1JM/gDor5
         xEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        fh=f8nzrL9vQUTRxgyVEAd60RxokvVzKlvqSX6fbpTfCco=;
        b=W8EPw5fnb6c+XZ5Ge3xsSOtaYJXqH2ri9SdEgD6FMW4ObeUHqXOlUH1zJOPOPvcgE2
         nuF3Y4W5l8RRHkYBNMyTWU0CLSY5KQx+Pd9vyrcUGIl1J5OMo/MUowMnjl1ccHSgJzPy
         pLfJDlFWhtcgf+2bNentbaZPfXpuUNnu8TCHE5o0NzTTqvoiSCFjuwPTEk/dC0ZSvZKs
         XjFVzj3z0YKvO2E1giw10CnvdGcphNwqp1EFik2cLKyDdjR/rytBAJ9t9d0aRnUwP8NW
         CBTBQ93vO2unUGRr6ZBRIq2evE3uvgKkgivUCSrds9NbCY3UzOOmk0cyuvVG6aAh6iRD
         LDQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856125; x=1782460925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=NhjZgieiz/KKeqAUXR1dIKJNEVwgkPP3wUJn2+Ga5DZJJIhkPRyCENovylGoiyxQJW
         uKWdIJCAH2b9kj3Ugw+3U0r/GW2EI7CB2cOLR+p0MwFIGV7XcFcnhDefuv6LBp9gm/ur
         xZvufGSbnZdK9kJ9Nl4a4xxzV1EJrinXA5W+qm37rDfg/p8uQkhCN8V7c5O5FQD9tlCO
         tkM+8M6m5oa3FPwG1C6P6t5AfPFXE2YrXpGh8LkXolwT/djxRMyfSLwp8JPqx9UyYbt+
         OjQdfPXXZ0cJIq5xotVK0G36KvQqCQWW0nsVvzxmZSTTzNehRKJrOm4KY6axTeiInOPg
         Zb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856125; x=1782460925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=IttOYiWf6GmdxVUB84my0SeuKuq0Yh5TG2EV3bqs3dfy/YDTDVc9cto5ejYDy/O6Pr
         qnJvZ+y+2L8tsiuXV04s2z5FEnRw5xKqk/iSIBGz5UDL+OtGLB7ZlMc/IE94Cj8FcEB1
         6R4eaNqDFS+B7wmkW/A3NxCHoIFPTV0w3h6Ktv1PA+kSyOvWN1Rcrg6ZGXbFvbsaapgq
         BmMQ8hjmkaeQvL1bfnXjrswwhTfrG17EO3Q4prs2plAN8OpxEo+OxEX6I/6ZrYcIM0uz
         EgFud+y82cJEYA2IxX4r6j8n+i+6dZiYsWi5qkC9/smViprfGlz5bCaN1J0MOGSDAuCI
         87Qg==
X-Forwarded-Encrypted: i=1; AFNElJ/pYulo9nKYonOaUN8yP9NCKB+9P3xEfgPgGHJYezvhpD3Zfh4YAW0i6hkDAVcGUrTDYh4MfGdi3ya8JD5ylw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhs2iB7UWVClr+95mLNtmAQ8rfUJLDgXJLdYwsOM+1JSNQYmHM
	ISF+7pSyGECh38BoGaROcaWcU3ZKvwnoj93foqJ48ZqJJULKKsC2JAR2Qi6tbwmGPIZz1R9dh+H
	Xlsi14dfVj3nIXF56qax7IUsNmUktPsc=
X-Gm-Gg: AfdE7clUIRBFIAg2puHVICG/Jcq58IMjRTdsxXihzYgKFMjxCZtAJU5GHJ1sGVLgrik
	Bmy+pt0N2mQ65HDvbwXExwzoNAluW/n8FQxTdtzuCvmd6Bw2HLKRPFZ55KMvK1oNCli+KiHmM95
	8/7wPtqAT+6sQ0qqoNS8zimFVEoBhiK5qkmmj7FbWW6uUTOXTxtgnVhMdVPSlw5aiCQvSaz9F/+
	n08H++JjBoDmOlhPlMsDALxdThX2HYjasf/EaWVX/045oOEmQUr29P2NKPghTqc2dTqIuljsHzI
	wb4ufGDVK757cMYIBKAIHr7RfZvpuwhE0LwJJ19o5VNR8k9L4CjvC5tRRIc6ytYIEkJKMGYxAZs
	gWhDjb0eoTgz3
X-Received: by 2002:a05:7301:4083:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30c0710707emr738158eec.3.1781856124490; Fri, 19 Jun 2026
 01:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 10:01:51 +0200
X-Gm-Features: AVVi8CffKMpkvKaXkC2a14km4xiSSCQKaVxWsJd6YpU-ayq5fx4Qr3XyLO-NClY
Message-ID: <CANiq72kbbhHA8d2wtNbaPR5Xx2kC25_D1r-EEeZWn7ojo=M7iQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug, the -Cforce-frame-pointers=3Dy flag only emits the
> frame-pointer annotation for functions, but not for the module. This
> means that functions generated by the LLVM backend such as
> 'asan.module_ctor' do not receive the frame-pointer annotation.
>
> This is likely to lead to broken backtraces and may also cause issues
> with ftrace if these features are used with functions generated by the
> LLVM backend.
>
> Thus, use -Zllvm_module_flag to work around this rustc bug if using a
> rustc without the fix.
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Link: https://github.com/rust-lang/rust/pull/156980
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20). - Miguel ]

    [ - Adjusted Cc: stable@ as discussed.

      - Added comment with link to the PR, similar to what we did in commit
        ac35b5580ace ("rust: arm64: set uwtable llvm module flag for
        CONFIG_UNWIND_TABLES").

        - Miguel ]

By the way, as far as I understand, the `vger.` version of the Cc:
stable@ address is the one that should be used normally:

  Use ``Cc: stable@kernel.org`` instead when fixing unpublished vulnerabili=
ties:
  it reduces the chance of accidentally exposing the fix to the public by w=
ay of
  'git send-email', as mails sent to that address are not delivered anywher=
e.

Cheers,
Miguel
