Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DB444C64E
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941135; cv=pass; b=b1D3n95H7TWP1Ook2YNobKEe79xa2rXXB+gckEsXs/3o3yS5xEktB+oJNHl0r335NTfmvlf3vd0UMmQGy+awlOfGDj701ASKjsvCQZeEgYnzK9fryPxT4mLakatDrt2dcN+6YgzMjethmA7QjSoptlWM5vv3540ZAP9FFVUZ5oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941135; c=relaxed/simple;
	bh=PtrcaN2EICQuixSidXkdAeZUjbAr4kNZ4zmQ6EU6LkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTxSmQ3GGRp8q/u3i7EjYQ0U7UnJq23Z2Z1+t91BpGWa0qx4izrc7xYlnKnkPbM/GV5EQwbq8z2u02Ap/fGYXT8EN++ukEt+kadlVISrrp8EiB/RGDSFDAE2o3u+Q8067d/7m0MfT/8tmk4nYMtSqJX95uO/9ePCqDFdFdCeGGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY5sHadW; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY5sHadW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2565so1088697a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 01:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941133; cv=none;
        d=google.com; s=arc-20260327;
        b=NlCUYs4Tf7DR9bNwM56uDtZtTu//IRA7bvtusDIg8QD/jliuff/ggs5KBfun9XBIS8
         Jlr5MCMnVRRyNN1fobXegGKagwyhfWoU9yb56S/dp+UlA8PDJK/5fzZKGbM217aDgMp1
         EwJxwogCV5JaJVZq4TttgMG5ARmQhr7e1pBsogsM6zeIl4JvNyzZNkyBdaxOEGVDvf4U
         E58DuT57VvN9pQRw5imuDhQe0CReVrno+pzGkayEkfY1k8BxtZy75ZHYCR3HFu3jnjs1
         RPHE9l/knKochunxUSqhDMlMU3kSsiDqI5WlOoT0M5/IgDpwRyIU4bVeEdgBNtzS7Oj4
         wQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        fh=Jn8P0Wfc6LuzfZa5VMhsLBZgyoTHUdCdIF30sB/l6yQ=;
        b=MwBizHaAIuDxxOr/kcWDQ5HXOxGMokif2sbbroi/5V2kbmh1UNGX54O7463fjjRcYv
         pD3i/xX57FyVxm5LgfVkcA9+yeh7un4dcoaqnCEz3sJJJvpr/cf6St6b8F377wD9kAmQ
         bsJOFdQ3GQOo0Ef8sSZkSpU+gLNVwKHeVfr8C0b8teW+IEBSRb2ZgvlbG6bZx+v9IVYQ
         FlShgrrs0lmy37gh0PJVh9v69ZHePEmU9k4qeu8/fktTCIcSZ1x3k7zE5puh8M/HxvI7
         CuwnrR/pnyikl7V4EDMvy2Gv49Ttevz6pVKgO7PQ7yEEJcVsG6OEicIFlFe4Vtm0B4Kz
         LL1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941133; x=1789545933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        b=hY5sHadW1f1icTS/eighd6eMp6MkmV+m/QdByMEruXecmHQ2SOTTiff0FO2U3GmZt7
         qM//YbSxTjVC3BdJBIX6A7nR57+L4Xkdqykf4Rd/zZUpBK+sZOdinAJpAHmKTdTxn671
         QztQliUcpItem4H0N9ZJuWONsP3rXlJeJcSVmGU1S0fe2r5UHz6XoZI3atPRgmKR03d9
         SucIJUYI5krAlZPWRRisTEynAtMyFBs5g3aZuYGf+hgGU/4rym45wV7TbzRb+/tsfFW6
         edyivrcNPXcBBboBRQaOiRbbw7h2lVZYLhwsd+OKGXLcrW6OgTcbwYcY5G+T7PZFUOoE
         xyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941133; x=1789545933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        b=dC/hifNyPF/alh8ID/BzwSA7Stf9Tn/r6gEOHQWmbtuqTOL5nP7Y5JYq+40eqiggPM
         E+4zbI6NonQFYn4CjhXbvf6o6LIyY8xR4kVJ5PJnjBhU28W90/7hFjIq6ROVquRJf+Tk
         E8kEpd7NnNOj80e6BQqMtaOLnadxMcBfsyv8ARxPYvpJIv51sAYdmBvmbbdUFTXtge/h
         KQr8oWQT0E6mFCIJXMcMD2hQur6gkWMOqFJZejU2hGzXF8SDypS0m3vZIu5KM08SzdxG
         1N7AoWtlvz/sFu7DKZAj2SDpYkOqmjyPFTHtdNP0DLwzzK9UVhxYoqSt0iceDqMM5g6n
         gVYA==
X-Forwarded-Encrypted: i=1; AKwUvBxgMyLYP7+CpDPmCTevieibLinDXN50tDKMcMdoJN8rp9IQ/A1halv5WCbNBBeWa/Q9SRh+nTvQQrepgCiHaw==@vger.kernel.org
X-Gm-Message-State: AFuF++luiXKXTXchvhNDgKgy97P1E4bS6QMZdW2vd8D0KSaZPchz43B9
	ppn3O48v+jt/8QTWVvPcPOfFX2jWV8M1mKxo4LfXWYitxA4r638ZMoH5kFX+DKNDIJ/WLHJZ3ZV
	KL9+Rq+nMifBsMcMNjjX2aU9txH60zRg=
X-Gm-Gg: AYBFou0A+VtOv1efXUMDLP955SkEMvGiIUl9X9Jv1OXCf6ET3N/Sc6e7InOI1Gtob/C
	FljMfqJXV68glqrk8rzi5ydj0Sxht3DJdWd9rJ+3OiPUSwtwfQFEVib0fm3lU1QDTkcqyIicagG
	DAq6b1n1LmL6z/jslvvzv/E9zfWZjKva+wg5xQ3W1iwlIl/J++EOtjnapGL2sPm+wOjZXl4+Bys
	KuOKOfm70h7fGMQM+f7VmRPhI38YheI3dPGHK2PLqwMaNUV5gUSRmaktbVLtPf8Cjm/2JsWfTLT
	tjpiTcW8lbqImk7Oe5cs7oJjTzBCi0o/hsjtkSUpozKZqM6/opK+o2GSvDYS70ADnQKc2jhM79l
	bGUUOnYjITm89eMFe1vDEFbWU/gH6Ug8n2ezW6oYpyzv1keytccMASAaLu59FE/cwaQEfwxsWlo
	BUyDq4zjoBUzkMVMHRkn5j8V2ywiIc7WuIA6lhDucKnCEloaOVWZ8=
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39b3d5c4449mr23521825a91.1.1788941133232; Wed, 09 Sep 2026
 01:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908175427.47207-1-klarasmodin@gmail.com> <2642740a-b894-47bd-b26e-cabdaa14d8b8@suse.de>
In-Reply-To: <2642740a-b894-47bd-b26e-cabdaa14d8b8@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 10:05:20 +0200
X-Gm-Features: AcwNN1VaFSH3EyJDGBY_TKDiMWxaUjeqs441wwiCpqb3pVX1iCtXogyjN7rFa0g
Message-ID: <CANiq72ntt_2n03UReCt6zFD_AvTMvNE6O+v3E3sURTsqW6x4Ng@mail.gmail.com>
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Klara Modin <klarasmodin@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Manuel Ebner <manuelebner@mailbox.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:01=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Please see my bug report at [1].  This patch fixes half of it. I still ge=
t

I think fixing that is the respin that Klara meant in

  https://lore.kernel.org/rust-for-linux/aqBf1UYNR-Q3T-cs@soda.int.kasm.eu/

Cheers,
Miguel
