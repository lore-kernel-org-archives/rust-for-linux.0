Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hskSGAh1"
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AB0CF
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Dec 2023 11:00:56 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dbcd28d5004so913633276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Dec 2023 11:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702494055; x=1703098855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6dWvT6PF+6HLwc0QHH2Cen40zzIVktvgbFUaJnS1p0=;
        b=hskSGAh1D2Mo3kKA+x5cDjlaF675LY6NmDlEmcEm3497VWd3J+SqMy6C9jf6XG2Ibo
         l5EeAP++pcl+ObTQne5qBsK1wS21Xlb9SNLiS3WBnT309hS/13phVaYPQ6V5K+6EtZTS
         aVEcLN3LxsAnqz+tjyOPl5bu9yhtkqSIhHs45L5Yso1G52AIfTl1zXS8tNqyXKs8zKSw
         JeLIfOvTFAWMr7RsKzJvybly5mr+OaeCquE17EeWAqy3A76xMm6bTF1e7OEtLv/4UcFo
         1pufIh7FUACBNHW3bO7VS13mmMJuKVN5G9y1DmR9OZ9Sb3lcPaKT7E33ZhtPseDfCjpm
         lutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494055; x=1703098855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6dWvT6PF+6HLwc0QHH2Cen40zzIVktvgbFUaJnS1p0=;
        b=gO1VV8C6zS3m7Jg+U7cl/NMwnEFx+vVb+M9KCdomqFNMUudV4v3Bdeo4yk1uydSD+K
         8XdzOqtYlWUaD6Calvu5RN4E7NhLZtZPwq90Dt+lNvd9CiThf77LaEqFDCWKAi5qPZV0
         t8YKh0bBfaDvWrfGYIDg/EaWIYEueTjOHY0/puSSgg0fyj2lrcKaqazOmuMgGZvGqnJ9
         6RjTYsVrsfm+6cQXnr4EPQnsggiUzPKTiZjL3MEnAQAaUdOPzPXlrt9xp/SdB4ZRSKYp
         zQo6ajguVTXHcYO1kG0rh4KszNupY1NjFTLW/jqIQUSQ3R5K3LR7cj8lafyJEP+R7nit
         iOIQ==
X-Gm-Message-State: AOJu0YwA51LOOvUkxxw/ZNOBLppSGOxPbVw+yK1YSrs6r+2R3zDAzfK3
	eNunYrZPxHeuE6bdyOrEKxDTrnVHAvdXblPuoMg=
X-Google-Smtp-Source: AGHT+IHjYPEp2A8wUIhR3eYryBwKXauN9dlErlC2VzVkgVPjYScv5yQfcmZM/X7nfUe32g94vaIbIdaboNCdZFlVVno=
X-Received: by 2002:a5b:70b:0:b0:db7:c210:62ba with SMTP id
 g11-20020a5b070b000000b00db7c21062bamr5039373ybq.19.1702494055323; Wed, 13
 Dec 2023 11:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com>
In-Reply-To: <CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 20:00:44 +0100
Message-ID: <CANiq72kNBm1woJAy+64rLqSWjhp16BD6=Uw5Ah0qNH=NAcnY2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Matthew Maurer <mmaurer@google.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, steve.capper@arm.com, 
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 7:31=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> If we really do want to go ahead with using targets directly form
> rustc, this patch should add `--sysroot=3D/dev/null` or a similar
> override to `rustc_library_cmd` and `rust_common_cmd` to prevent rustc
> from picking up any already installed sysroot libraries.

For reference, Matthew sent the patch to do this at
https://lore.kernel.org/rust-for-linux/20231031201752.1189213-1-mmaurer@goo=
gle.com/
and I have picked it up in `rust-next` (with a couple extra changes
noted in that thread), so this should be OK.

When this series also arrives in `-next` I will be testing the
combination further just in case.

Cheers,
Miguel
