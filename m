Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300F2135D7
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 02:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393375; cv=pass; b=VgE3LlG6wymCVyA3T0namSFSPuc3vS/CNG1q6tkBDUoQV3sP7qrPSBqTBrywSGITqKhs1BUeL2Jx32Oz7OlSe/6XiO1dljCSXHCE4bc2zBAJqSM0An1LEp7tfaGl5aA/jaCdr9GJ05OzKrpq/+B5q/bT1HafI0m+Nl0UvxTVuYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393375; c=relaxed/simple;
	bh=Jz3I2xiOMH4dsSqRr2L1xkjQM/X0CJzHvJGI4kykhuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfbXwVR88nW3AmqtpQX20vW+UtDCVDBxESiK0fwE2RMf163bI6MPEGZsoeLv0EdWNwO3gCSacykyrsRnPoCUeWVtau0iu1go4i8zB/nPQ30QfByaL990uFmu01ZCg/4WbJXVLPBHZyRmpyOWHOYUSlcZ7wB+h94GjVfTfcqslCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikXkOnDZ; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikXkOnDZ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b72b154883so117754eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 18:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769393372; cv=none;
        d=google.com; s=arc-20240605;
        b=jdI36kMrzT1p3F/YKwvcUwdqWQr5Htb6/t6mIyEZu3OPBF2PwV9djQR/tjEzFHr9/M
         cBtKCKxykmbeXQYJSS+X7kzwtLoO2CPTjQAhJMWwkUGmaepk8uUpLIUbRO+e22vB5NAh
         ZZLyrFdWFvkVIaFERM8pjuM2FFpqQAu88JaRdhwITJz3O/JHHX98+XC1rPa6yWUWT5kI
         U20R8utYmnNMeAemg0DW7BNBN/sApuYyxG0gdQ1yFmoJ3l74w3GTMzAAS7PRLPwcyg/4
         2YBZZgM5YlhkGEA2HnZBzFy3PTppKIPUZMxzCVA4EQtLkXOd52Db+tX8rjJrRF0696mk
         vErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jz3I2xiOMH4dsSqRr2L1xkjQM/X0CJzHvJGI4kykhuQ=;
        fh=hZPqabN0Ao7FTkKjq5eQezj+0aiQXHuyRgXadSNeJEk=;
        b=CbPsar4/SEg5aNXNuTCGyJbU3PLT8Kkl9D/E0pOXPZD3Y0+JGOzsFs8EOMpIn1L7q2
         ybUQr2aNDs2ulaW5dbvVWuPxMCm38aREEsk9deVANeREoGnXJ33JC5jI/g8K/FMF2A+h
         Shvcumm8FIQljDDKLbtO4b9j56r5PPp/a/CgHplBYObbM1LoO5kIDqwenrLc4WaOq3bu
         SZXTcd4S/vWG04ynoUT39eNEMdVnXoTB1Pikvt/ftpSTjziayWQk+yNlDuxD6+pemKks
         Rv/qxoJbHjLduzjuwKxEOvj3i68f67Rp4WmOgNoe78W8JFqCtfjsKmKXqkIl4qSgOrQm
         D2bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769393372; x=1769998172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jz3I2xiOMH4dsSqRr2L1xkjQM/X0CJzHvJGI4kykhuQ=;
        b=ikXkOnDZbTAAhPceMdGjoxUjd88fW8di8pcAvxrUcI1XsG0zWe1FWOrWyVoOfNz4EW
         +tFqtSYrPBn4f1wClUs5nduh9xJ7WCMrXEnk6ygxTqymhC/srl5dyGrrEMUNfpje+a0o
         RrjrYCpV2TR2RQIc/Xu9Ice/mLvD8HVGfFLoEC06hHAqXjjBMRc6n1o8m/zOhwQJc9cF
         V0zkRL2MfViPdYWxZWovI/jqR0aMyrBGyEYBflmPKhPI9HyqTN3WSvvx3u1MTscveiJC
         gtiBJQyG8YzFQ4/KyeFDQWsrSVwKpouiAJDENx4FYGN1R4dKReH0FGXZos39IPtYPPxV
         itYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393372; x=1769998172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jz3I2xiOMH4dsSqRr2L1xkjQM/X0CJzHvJGI4kykhuQ=;
        b=Kl+W1+4/2OnJKM0jjzNWQPKhN5i456W+JOO7zFt5WLdIWKtvPgISEewD2qtH8NknlS
         zO3kKj8eO6wAbOVEICDZtSKNiZWPpdSV72ZumhFVUWWG6W2GiKXLeg0+VRLoOuDxJnNK
         JESNQ2A9bRY0YDVoxbF73oHW3wqnV3ooe3VQEeGMY/vAUrlQ/GFygVXODXIDk7eHIkl6
         wuYdL1Qjy88gc6S1ORT6OTpHPGS6Fp1hp7iLNaEg2iAmGeHgC/uanttP33amMYRkMgP+
         XxHB4AkrtIY0P3cK2SP9SRaDIhHWDwsnn8RWgbTGVzVLe7BJnsp8d1qizlNpgOvpBMG6
         iA9g==
X-Forwarded-Encrypted: i=1; AJvYcCVXNfvT2jcXgcWeeu7QyczRQvkVV2lCvoXsW0t6LnHoZudGqJHZI4ryfqoyPUPtAAOq8hK/nxHOaplVGew15w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8MTXjMs+7c14F4AKesOuM8WNktvWGfWyCuZtnrv5FnrrKNnq
	I9nCVbZFAmbEWHUfNw18i72PEZZ+tyqmt10BMnbaXEuXMqDlVahcEQQ0sdhxckDoDmjJ92JqwbN
	YC2zL7THbOXUjzBt3LQJ476eZ84zEQew=
X-Gm-Gg: AZuq6aKhaezhZceTmX738gFAcJX9NbxBft1lneAayaY81PuCkGAI2C9cQyNAhymhTx2
	OkqJKGkPoB2ErrSnT56MuNIedIncocsZwnBDBZ3vjqTkQ+AQg99xbQtGVRW/CVsAzffR1GMIMpB
	1ziXXwBoUcdp36n9Ymm3It7fyeC7iWMeWeW/0DoU0TGOzgDt5n8ai+tIE/qjzdZerT97Ip0aa75
	MYbalW0M7W6ST2VGHEEtfc5KdzCdFTWmaCgrhPId1uG/bF2co48s4/jLnY92RMm43zgq5X456Rz
	gGL0LVl5xxSzGwb8Vf1fkxlym3zjLMFQeqYcrDMujj53fDP7yIzPrEjKrq/LJDH+4IzBw2ns3ir
	5X8u5tHVuQeH7
X-Received: by 2002:a05:7300:fd05:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b764827c0amr701434eec.8.1769393372121; Sun, 25 Jan 2026
 18:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
In-Reply-To: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 03:09:19 +0100
X-Gm-Features: AZwV_QjYnttxa8bvLMHgNOmfF2FVoGkMDwahOX10J0pKmMAcqi3vkBCQ8sevelg
Message-ID: <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Tamir Duberstein <tamird@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 5:53=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Generate rust-project.json entries for scripts written in Rust.
>
> Use `Pathlib.path.stem` for consistency.
>
> Fixes: 9a8ff24ce584 ("scripts: add `generate_rust_target.rs`")
> Cc: stable@vger.kernel.org
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Hmm... This introduces support for scripts, right? i.e. it is a
feature, or am I misunderstanding the Fixes:/Cc: stable tags?

Also, I don't see the Tested-by from Daniel -- he gave it on the last
patch in v4, but not this one. Was it because it was assumed that
testing the last patch meant testing all? Generally that shouldn't be
assumed, e.g. he gave two Tested-by tags, so I guess he didn't mean to
give it to all.

I would also suggest on apply to give it a bit more details.

Anyway, this seems best suited for rust-analyzer-next after the merge
window when the above is sorted out.

Thanks for reviving these patches and splitting them!

Cheers,
Miguel
