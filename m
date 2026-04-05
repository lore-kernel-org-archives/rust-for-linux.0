Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE22F6586
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417404; cv=pass; b=kSdKaFSBO2ryyGWD7HwiPKEktQn2g+bEDTHPg9YszjjZtYlTtWdoUAG7AUoC2Un8cJ4TqHBhVng3uHBj2ob2szVeGovlOE4JUndVn2OUy/aoQfz678/s3ulM+UwdVi8MMUuXxP5ofbsAD1FFooPP8k3Y6o/ZXVRAWap2MRzMx3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417404; c=relaxed/simple;
	bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhmit1T/aaL5kz11yc5so2wbN2kTuaCuFqEt37QzQSvP85z+RzX6C5NhTMl91m2kCTH5mElDTH/aDraFfE+1aj1gVbkVu3Y75S4mceMtFu6z8iMbtfRfFp/IBSKO2LA7vxMqser3XwVmI67yWQafLLmWzhR27DWEHJqfj/C5gcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRfJiYT/; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRfJiYT/"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cb19ddda43so250149eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=juFqRVl5EV4Chy662SrfzIRagK274vQKpPHUdRVgMx1Wi4H4zVoSHYltcbDBtoZ52S
         NjxBPOdTDY8LFWjw7/9pLgxbNvb03xMJKGuI1tbL3fef0z/nlPls8oNL6GE9xQOfpAOc
         YxawxD5ZN6MguyszBzpYSydMw9RSrYnhuah1HfzBASM/Bg4A3wEkKd4mSA4i1YeR4PgT
         akcR5tGZJL6fFEjP4BBxWAe6RFQuAle+vi3rucvv0VlZTYYb9TS9eiIsHY6nClqP9f+7
         0x15hvkdCubNpSOJY4nVxfPB5SDNKZKRFcWZnGl4sXTo5qXRvIT7ssI46SxM9V5DKGjS
         gV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=hbQkjKd+GtaBALZ4Ie5cboPPmwoF9/R1BKUoFy62GTo=;
        b=jl2hVDNmU3MiAWKQWRixS5gcjY2sDc+8CJNicPmVuYdgufcn5HMamB7m2BcRjHKszO
         FCiCV5Qn+uV2f/99XBqPhn2bgwwlI8wOHSW07UmGfVYDvRSr6vfyZr1ypNZ4j9jDzJ+Q
         p2oQeBz2hZLLUm6ee8qSkWqmOHEScBlNrNjfgsWw+d6L+Wf1loaHkTH+YnQx8JSmddwo
         xh0znk5fQfPSY8NrVWA7p2Sk9Kj7QcqFiywkH6VEq6KsPZxVBb/fJH93IM9+sqanirzI
         mtq/4VFdJ6s5R4tY3PX4oriWyJZs9GCjE50c3JWhSr7sQ/2zvVjmLvlvKrBKAc55UT9Y
         KBxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=mRfJiYT/+olK1iMcCR1Eq5zd6EtYOTPK4JjL5RlYfH0hC+yPxbhFtfGeBKeOVVNDpP
         cAbjCbe9gDZQEEaEAYDH6wJGt2ogaBEK4SrH21K02nQOtwKHt5OloY88rxjSzHcEL2qj
         HA5oy1Q118CPqkIy7UOTuJzcKoulpGte/Msdgpp4i99bjOviHP+vaPuGXMxoYxCsvQIp
         rG1c/qF0ENmYdCWW5xxLhxtuCMsHH1A83FMtBtZIA+v6cJ18kxJ1G6f10aKzVCZ5AWnO
         etgmpMTc25U9ObytySL+cEJgB3u6MoPbEdD3KxUPbP4zHyviw7hMzRRL4HhsBuljW+PZ
         G/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=ROFewoSGJlhGidvrkXrq45G89Y/NJibDr1K8KH/IU/W41DSfm6tc8b4B4EvhhaUYsb
         Mwsyy3Rx0c4JlEiHEFtnD2OJS2ijJbaHQ65lOpAjr7a1QL4FVq4aGSXBQTrxflE/AXca
         AZrFsDC7896xkjkRGSB64J/aWxgOHpDeTVW1yrc/EjBptK49HK/k5PnTEVSBX7P5Y4fB
         0pjHzrFzquDjY6zSjFou0t8hFAEywx2nnK8MisZwSKZwT7coRNpWimQD2ga9yuJ8fg9u
         RFknO+M5LFYT0QcV9flAIw41EmgEc0x6Wp158KJNnDrS7rBMbPIN16Vue7kd9kh/+yPM
         naZA==
X-Forwarded-Encrypted: i=1; AJvYcCX6D8j9OESMsDxvgtT4GrSFQ3VcbZAW0rWwfsOkVpg6CAcAkhoedX5KHEgL6+Lm6X4Obte2vRjHct5Fj639vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTr+4A/mVW0i6B9qFaXrXEIooTTSbcEy3+FMcbPQpZJ4Gh8zH
	TCICO74EL0ZEa9YPWmR0OpSxM/fGCa+C5LalzUEA532PV28aypqQmdlHk8XbCdLNN8G0iPhhnrN
	zwasYx2oeu5CtLaFbPlYLN7hgQgNwCHE=
X-Gm-Gg: AeBDieteBbslVLDkbjnzf6Cc+xBjJ5JF8UZghjvSUQcPTzo/Sy8g8n2bFoqFqBuaB5M
	6v/3oMhIiIVWxUGzt/5B/nxWNJHP46s5nAE1/jZ9r9zF7fl/KjnCOcVYoWmqqgjeBy1b46qXx2l
	lFiwi8sZeS00BFlRqPJjMw0v1wyco8fBnMFYrRsxi5N+aCJE8pzfHi0MKgi4wv9y6CApfhEi1Yp
	LKrlghnuTH/mknbC2GBcy5fyQ/OCdmk9kxavEmyZofz1KU5U/RyeECjQknZtWDSwkBxTWr7gJxZ
	uzDNX0Ub6H80dE8/nvTt051OtUBpASnrdw+znHgDWo8YzcC7OQAWWbvarpYLx1Ua9HVgwGt34jz
	fQ6miIdV8kIV996FEr/12kZA=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> "beyond" is probably not the right word here?

I think you are right -- reworded.

Thanks!

Cheers,
Miguel
