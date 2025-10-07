Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6961E835D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853526; cv=none; b=WKw2f8bsfEunk58bm3oct8atMYhTrJlVxvJzB/8g6ijYwYMgH1YTO1HdfcFglABU/GATK1W2VNVQc3SZSGlWL4toDswhv0M3IYG2B1oLmmPmdHimvmu/Ebu17/7gkC1CvtFTAUs188Lf3CPsTQ/mO/YR51iADP+VUBn7jBDyIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853526; c=relaxed/simple;
	bh=DKbbE9zhzl8rj8dEiYIYxy/R/PHBFZakQ3bjQJ4fP+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCTgTyC1KRMZ4dGjfAnc3M4OulFxOQd1qNyI129J9ZAA7PypLcQ7cSDSD/A8R2RaL9+2JY/t3O4YCodtW9jzJdznoZoL6/D4U0kcfY6RAUzXmVoV5/he5Jxuru9j3Ac0+xv4CHHEGrUl6iiUt5ZftqZ3OBgTeZbnqVzHppm1Oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VfiETrmp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VfiETrmp"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so6885573e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759853522; x=1760458322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5bhuG10RNnyLT/yO7UzTmBolSEBRqmJJO0H1HbQGO8=;
        b=VfiETrmpVZ8B5wdFA3p8j0Bku6rL20ZXXddxRY2RYplEn7jWUofEIo05rkC9X5V0TB
         AkS9KkjHYyeZS0z6f2Fn9h86dn6jARrw7WgX6XhFoIwU5g60lyHb6Nz0YWDQ5lXnSGOL
         mbMioJYQcg0WgGefPQ4W1gukuUriPkTvQZNeCypo2D9Rsx4zsFRolgcmr7g1ftSsVeEr
         iE+xPkipkA7I0z6keTF53lAf7pxUm2z6VR6rG7sJQhT/zvr5lWg3RdrCTsweJaw+qocV
         NbU0eruuF5LVSh/4p1H0WHRSZnQPm5fB71IvNFltzP2SDqbjF7/zBPOh90TMziXVH8hg
         E/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853522; x=1760458322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5bhuG10RNnyLT/yO7UzTmBolSEBRqmJJO0H1HbQGO8=;
        b=CuEP8rmsgxwP/s/ELr/K27S4IBTuRavdZ0s4sdfrrvaYUswcwRHqgmfpFywW3N2VTJ
         Ju8T2bPsVNuneBMXevUvTgyg1MRo8MERlTcWKOsiYlT2/lxNVQkLofliAHEsezs4ATOw
         rjDBq+9Jl5V0dguXmkT9rmGgwAjxpIx7J3mIw9YM6F6Sy0j9haTu/4KnorAFl7gAQAB2
         IoSNbAUYAVP/EVCT/5ddK3p3p80ZnyHjyrnlKIA9m5Z575n7WlLGvm1SKfuko2tfMkZU
         1kwe7HT476bxt6JEvi14rsDf2EofqKxnPhKpvAQZMD8XCsihrFwO3xeSMMIlpKD4+Lko
         9+lw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6GPdL/or/RFXgI9Co/ZBOo9gEOiXcprGaIxi3vSWlwRz4iKbC4tSRW+Qwsmm2PCZJMMTj8Hka2x4WofqOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ElO1lMB07iljGhTr435/lgAJK8MU/g8eLkSNaXoob+dqSpAp
	M8aE48/EvThrrHnS6buvblz7SBc7fZ21jZUtA6rPBBUqqCqVjchin7/R5V3+qxwW5XZWgs8nd93
	h/ePSoZgRn5CHGSw97sW3dqM0QzWGkVncb6/Ffir0uA==
X-Gm-Gg: ASbGncvL+pVKvagJF0WrcuM9YZpeq/RUEsUydMuOQOtMzJUUK3KvzwErwyODsNgSM9M
	ryD4I4Ya5jbxnH3x/iGUU89KYVDWYdgkD7O4iknadXTnJzGeNwLkLgpImE3AdN71XmU+z2Zkcc6
	Gq9ZnVMzS/GE6J+8MbLTJK2HovsZJOIwKp7xuAyB3n0kaIQ5Pkj39qALdc+bq7qXZ3ON6TBUt1j
	By6ldsSmQ9MC1/t3Wk24s6ThICn4XjwV3MljQ7aKTVEkMsibpHiqb5l4B1Wa8kL
X-Google-Smtp-Source: AGHT+IHX0cFUUS7eRKIKaKVcU7ZmMlwLAYnpxVGC6vvjEjVKU434dsb7KybmLTqBGP/xV7gGB8LzmY7ktetDn1iWCBA=
X-Received: by 2002:ac2:4e0c:0:b0:55f:4926:df1c with SMTP id
 2adb3069b0e04-5906dd78cc8mr82432e87.46.1759853522340; Tue, 07 Oct 2025
 09:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com>
In-Reply-To: <20250908160224.376634-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 7 Oct 2025 18:11:50 +0200
X-Gm-Features: AS18NWDsb6wrf3RYNSLoxV9mybukDyVAafddNCj0OceaSnnWCaOwUw7AwfZXpXE
Message-ID: <CAAofZF5qfkib8gGdYnzEUSJv3LCBdNODwQn_Dk9x_zo5-XTWRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: replace use of system_unbound_wq and system_wq
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 6:02=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> Marco Crivellari (2):
>   rust: replace use of system_unbound_wq with system_dfl_wq
>   rust: replace use of system_wq with system_percpu_wq
>

Gentle ping :-)

Thanks!
--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
