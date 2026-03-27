Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5EE3F2111
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632500; cv=pass; b=dVo4SCv2WLaptSwqMeIVsM4mkqU9YN++Vu3zK7V4wt36g/3BVj3B7ANM1Jk8ksR3yZ/wxyp0OWn3kuOpEv5Ec0hweS6Iz6wcG1o+SafzunVblOr/E1xYrKTOc3WKlkZFWk4UArrIHAo1RrhB0x+8g5LL4Tf951JyqvH3fcZPP0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632500; c=relaxed/simple;
	bh=r07QpEoVNQj/cMLoIqWS+u26NN05SjTYmHOe7gn52aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cw6GdmAHXkGBYAplf+asAmVeLaY+rVgOrr6kA8JrKmfpSPlZ2bJooKlZmqVmH+SB6FIMXXTGfQk6AJMPzZSk+YifC8T4nkFm2vCPW7Vqs4EPQxjkLla+FmQYmIeTDNSL1P3lTvrKVUmYhYYBQLaFx9F/bd765y4p44ZGZR57B2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2HvB1le; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2HvB1le"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12736a0147cso198168c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774632495; cv=none;
        d=google.com; s=arc-20240605;
        b=OdWAg8hevn9NDG7NShXXcjDOjiDZ77BoaJqGd03Ce1oC4PzKgsXJ/2xwKWZdMZG4tk
         RkhCGaYo3cb+Tkv7eLEpUJ+S7JNWoUYdW20/6Oo9orhrcM0kxv9O/+Kg7h1QoPgsjCxX
         Ei4HO703JtYRpIIyRC6jnt3yjb5dUBV2e33gW3kRQgpB3YjoXBWiLNW6xRT8aUgwZc5k
         DsKJSbt6zlCtjygQRPk1OPvzJff5ZKSTkiXSCQNpkNQkv89AcNf2Zr4dcYlCN00D8P9e
         aDXe6Xhldp0fpfvP+nd76Qgqc8Re7Lynzw1zPEKjWTbbXjOd5axcNn9yKYdvXaJJyRTM
         jhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        fh=/reSLTAE0rVxE817D9w0s+NYdcu2UKYAsasugY1CKys=;
        b=kDEhTrv2OOwKQmt8GuAAkxFapPqFGs8a27Dpr/Hf6LWZgCZsHX++SxE4piVlT7bb7z
         nw9N0CGviyAMo6zJJ2YHGx6OFDhZW1PxpL9WUEZ9mjDTRoXKV7ywVSe/3aBDKYDbj9US
         p/mVlTHo8bE33uprs6akZ62pfiHhPuipX74mv+VxVHiGSG+hgcrqOXEVNtt/7FqU0bHu
         0N0vb7eSCcqZuW9JprLbzgmdKwmilQZXTEfBi6fQCkhj+fhtTsUSje7+7QGDUHiqesE6
         RCireGsk3Yi8/yKBxl2h/rsccfkZ3S/Z9wB333/Nng1EAiylauGggBwU2nRtGMaws3hD
         vOfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632495; x=1775237295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        b=Q2HvB1lepZeyiEaMLs07wlt04OT8CsRPS6rD880plQuOUNt9ayBKj49ExUeXepWwsk
         hvgdVrpAog+Ve6cMLilo782z+3TBuiCYildMY3dsfmJhY715eDP/mBZuS7uHWD3Dz/ZU
         Y471B8ne05E/vVBPBGBn4DgaQSdJJSR2FDqx8sNucX2/cC8RDk7+UhulCpPriJ4cytxt
         74BIsv5Vq7gn0JugSL5ZmSNHm3J/huRtALxNUyGCk+oPoLBE6C9Q73xJomWXfhZOcapp
         PzRoXRoDIzuWBD3tDghLeJWTiExyXCswxd8fMuQo56yJvDx4qyCMRUjGMzvoZPHvXmwJ
         T5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632495; x=1775237295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fl/30Pozrrpem/yafXqH62BWdDU+A3/vTaR/fO+0gHw=;
        b=MJljKbBTu1eXNCxVmImaLOvy/G4ZezAZ/y+49Omr1sMxlKAQo/wYLvncIRqM0OScIK
         VDMKHCsIKEsDHRP8dEnD0W1EAdNddmUoBkQ/LaCQcdYbjx2IheaA0QDjxa2L2C5oeYZp
         qFHPYtOXJaJobukBk6PS7zJoiCQe5aKiF3oC/aXdqk0XXSw0XBcsdYVlxjm/onWu8GPw
         ici8wn+tDt2DSM30koglGilqQB8yBR5CEfdfA0Qg4iyoa7fMESCkuOjy6eECOz/+o9sJ
         1DFj5G+0Ei29dI+GhkKKkLYq/KmVh6Dh+YV8vJH7cZflqZzevD2DxokA3pVJ2orkK67g
         oTFA==
X-Forwarded-Encrypted: i=1; AJvYcCWvf9SaB4yPq7iwlJ6Hk9Cg3HXiq/sWTIxFqVlUlPYo2QWRagotZMGIG1b7+n0EG/fA/h0arTIHIJn+Q0PpKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLo5WioJzh1JJIJ8dC0cRd76KCCjHvEYaVht04thJ+TiQm60Y
	JK/xSas5ShFtNMbJjzzyXkJQFrM5U0U11m7zfQm84ScgJ1/eDl1BHub8VKp8iPy9MlNsRBrtQAo
	ehk2fIvROuKWhCihYK510bBccKiHOiAk=
X-Gm-Gg: ATEYQzxqx4mzetH2v/1Ovn+BMRgjq+ltKTgkBhX15asrSQl1FXNOwXnZlaPINZLuQd+
	QIcFcol6F1CFDwT+MXkvAN6zXcdJutOgEgSDesAC5q/YhvdmYtbL+G3KiTXA8qvRFa/tzvgParJ
	ZThNS2upHxi68G0DYASGNmoFXmZzHHE/NWY9Of063BB4G+SwMzIV3Hcnn/wiQeXdAe+d2TjJ/M/
	9buDuDvnlxtREXQC+bpJH8RzGxsGbw1Zm6jRpZTjr8ibN9o/bNtsk5RFcahH0iqaOLdLwkOQy+h
	po6t59XGgfGWP9G+wfwJV8WvKhjL9CA4v2NTyfErNP1e80aiJmO6sYJ48KI/yfAZJr1KedC/HIC
	CLGkHO5OQdhr/SQ1XRf5XvwefEATMV1iVuw==
X-Received: by 2002:a05:7300:2309:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c185f4e132mr930663eec.6.1774632494589; Fri, 27 Mar 2026
 10:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com> <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
In-Reply-To: <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:28:02 +0100
X-Gm-Features: AQROBzB_RVTF4XlQkJ9XF8lid9aR8wXF5WiHOT3rgHJbDAOKcJRtKWbfa3x37CM
Message-ID: <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:17=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I am not a clk maintainer, so I can't leave an Acked-by for you to
> pick this up unfortunately. I've been quite active in the clk
> subsystem though the last 6 months or so.

In that case, I could take your Acked-by as an active contributor of
clk if you are willing to provide it, i.e. with the "# Suffix"
notation I introduced a year ago:

  https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked=
-by-cc-and-co-developed-by

  cd9123eeb224 ("docs: submitting-patches: clarify Acked-by and
introduce "# Suffix"")

i.e. Acked-bys can nowadays be provided by other stakeholders apart
from maintainers, e.g. people with domain knowledge, userspace
reviewers of uAPI patches, key users and so on.

Especially so since you offered to be a co-maintainer long term, so I
think having your Acked-by is way better that having no tag at all :)

Cheers,
Miguel
