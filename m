Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FB1799E
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQlEo/hv"
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0013A2
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 10:53:40 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-672096e0e89so31052656d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Nov 2023 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699296820; x=1699901620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq7cm+Xfcx5d/JRksghdbRydo3gwPN/Ml0oamfVNC7Q=;
        b=DQlEo/hvvLkDMeWJQiNVj8PGrm4aq9EYPys5s/5alku0EyyvccTXgVFy+is/dyZen/
         QDDn/Gm3k1+DPHl1ytixGy2YIR7zXvfBjqwM4vcJr8ICKSIV8b4UGVDMp0yemhvUCt1T
         u0dk0iOKf6k/2SPJkMSHxi332/v61VnlR4d1fObDZwN4joGr7ptKR1C0daPZIQICG1wh
         +x7/uZJ24dirdfDr/AHSpNVLK3nu2vlWwmiY7EYjTwxQtp7bgzSGnrynu71xpwfUddop
         cxHGLZ0dYfKoJNAGOzTkxm2gjcnB31bgQSzaAkiOgpR9GPWPxBIA+lyIbYgFkr6kwPCT
         gU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296820; x=1699901620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq7cm+Xfcx5d/JRksghdbRydo3gwPN/Ml0oamfVNC7Q=;
        b=D6CKTuB3N5LD0EkNKcvP8sOJgoug5kyt37KV87154DdMeH8HHwhLD2hQJXwKZVnvSf
         ivpBg6hN1+wkuCkbhii1TA1Uiuu84GWmVmSlDYvm5tVU9hG6dltYybXAq2hiIHv/wo1l
         QxbMnp1a3X6Xbpul9MX+b3TJuWWMNOWlTZJNDVVP1DWwlkmU6yo426DSnAP9CY+WclCM
         YKSnTu+KrLtc57jJlJQnv+gWXto5mqAhtYNXTMtPa5cRFa00kfqICYXxQ52UghiAvXSe
         WDzJXmmySd8pJpZE4m7Ua396aeMew2qg4aIoP72PQtdFe5d4TlfYO28j5W92AsasyWsm
         M1OA==
X-Gm-Message-State: AOJu0YxthEvnugLXmLZW1BD6UdZC9kmMaB4+hSxau8slSNmNnPavlc+7
	ujY/DStj0xRFjqEQ7KVD4b8=
X-Google-Smtp-Source: AGHT+IHrlsT8WEQf8KRiDNBh50KbZfMbf/lcJjNTWbRT50uDf/FMjFKre1RTXXNBCqbpVdZKln94hg==
X-Received: by 2002:ad4:5c83:0:b0:670:9f8d:f7be with SMTP id o3-20020ad45c83000000b006709f8df7bemr45281664qvh.13.1699296819704;
        Mon, 06 Nov 2023 10:53:39 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id m8-20020ad44488000000b0065d05c8bb5dsm3638619qvt.64.2023.11.06.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:53:39 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id B9D1C27C005A;
	Mon,  6 Nov 2023 13:53:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 06 Nov 2023 13:53:38 -0500
X-ME-Sender: <xms:MjZJZbC5HYlLodqkOr90uuVuvDlTFh5YmF0ByjrJAEJdduA_jOnuwA>
    <xme:MjZJZRhMsixez3B_Ky1MFa7ZvwFnSISmWVlzd2NYXF7X67LMAIX7MdJ1-1KU53Hsq
    4VjtEgMrll3t7g8yQ>
X-ME-Received: <xmr:MjZJZWlOyCXcJlzCMNGVfIAq9b_0XrtpNYzla1AMgHMIhxK85bOZ5h_EyRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddugedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
    dtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhg
    sehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedtfeegveduffelfedtiedtvd
    dvkeettdevffdtgeetgeejfffgueehfeeiiefgkeenucffohhmrghinhepghhoohhglhgv
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:MjZJZdwka6j-r-r7GGC2Pq6As_uEzL0ClJOA1duKSXFm2gl90fmoug>
    <xmx:MjZJZQQe0PdDVVaCKajy6_v78mwjAXGj8w6mhIOu1OkTwOtzjLqU8A>
    <xmx:MjZJZQb8KiMC1vAc_aV3Mu82u7Ydp37sDB68f0moURqSLlqr3eQAzA>
    <xmx:MjZJZbJv11SQK4_13Z0Za5Xq7X6fARzA8bPjBG-Crto4hynTaA00qg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Nov 2023 13:53:38 -0500 (EST)
Date: Mon, 6 Nov 2023 10:52:19 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: No Open Meeting at Nov 15
Message-ID: <ZUk14802ZWGpR2iM@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPyqLJ62B2GZg6BA@boqun-archlinux>

On Sat, Sep 09, 2023 at 10:23:56AM -0700, Boqun Feng wrote:
> On Tue, Jul 11, 2023 at 03:12:15AM +0200, Miguel Ojeda wrote:
> > Hi all,
> > 
> > We will have our Open Meeting call on Wednesday 18:00 UTC (first
> > Wednesday after -rc1 is tagged).
> > 
> >     https://meet.google.com/vii-meij-xpw
> > 
> > Like in the case of our old informal call, everybody is welcome to join.
> > 
> 
> Just a reminder, same as the previous one, we will have the "Open
> Meeting" call on Sep 13 18:00 UTC, come and join us ;-)
> 

Since the next rc1 week is also LPC week, and most of folks will be
attending LPC, so let's cancel the meeting at Nov 15.

If you attend LPC, feel free to come and say hi ;-)

Regards,
Boqun
